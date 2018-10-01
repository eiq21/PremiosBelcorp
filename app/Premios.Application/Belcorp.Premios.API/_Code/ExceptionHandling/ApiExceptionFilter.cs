using Belcorp.Premios.Infrastructure.CrossCutting.Constants;
using Belcorp.Premios.Infrastructure.CrossCutting.Exceptions.Domain;
using Belcorp.Premios.Infrastructure.Transport.Common;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace Belcorp.Premios.API._Code.ExceptionHandling
{
    public class ApiExceptionFilter : ExceptionFilterAttribute
    {
        private ILogger<ApiExceptionFilter> _Logger;

        public ApiExceptionFilter(ILogger<ApiExceptionFilter> logger)
        {
            _Logger = logger;
        }


        public override void OnException(ExceptionContext context)
        {
            ApiError apiError = null;
            BaseResponse baseResponse = null;

            if (context.Exception is ApiException)
            {
                var ex = context.Exception as ApiException;
                context.Exception = null;
                apiError = new ApiError(ex.Message);
                //apiError.errors = ex.Errors;

                context.HttpContext.Response.StatusCode = ex.StatusCode;

                _Logger.LogWarning($"Application thrown error: {ex.Message}", ex);
            }
            else if (context.Exception is UnauthorizedAccessException)
            {
                apiError = new ApiError("Unauthorized Access");
                context.HttpContext.Response.StatusCode = 401;
                _Logger.LogWarning("Unauthorized Access in Controller Filter.");
            }
            else if (context.Exception is DominioException)
            {
                var ex = context.Exception as DominioException;
                context.Exception = null;

                baseResponse = new BaseResponse();
                baseResponse.StateResponse.HasError = true;
                baseResponse.StateResponse.TipoError = Constants.TipoError.DOMINIO;
                baseResponse.StateResponse.MensajeError = ex.Message;

                context.ExceptionHandled = true;
            }
            else
            {
                // Unhandled errors
#if !DEBUG
                var msg = "An unhandled error occurred.";
                string stack = null;
#else
                var msg = context.Exception.GetBaseException().Message;
                string stack = context.Exception.StackTrace;
#endif

                apiError = new ApiError(msg);
                apiError.detail = stack;

                context.HttpContext.Response.StatusCode = 500;

                //string body;
                //var position = context.HttpContext.Request.Body.Position;
                //context.HttpContext.Request.Body.Seek(0, SeekOrigin.Begin);
                //using (StreamReader reader = new StreamReader(context.HttpContext.Request.Body))
                //{
                //    body = reader.ReadToEnd();
                //    context.HttpContext.Request.Body.Seek(position, SeekOrigin.Begin);
                //}

                //var queryString = context.HttpContext.Request.QueryString.Value;

                // handle logging here
                //_Logger.LogError(new EventId(0), context.Exception, msg);
                //_Logger.LogError(context.Exception.GetBaseException(), "Error no manejado" + body + ", " + queryString);
                _Logger.LogError(context.Exception.GetBaseException().StackTrace, context.Exception);
            }

            // always return a JSON result
            if (baseResponse != null)
            {
                context.Result = new JsonResult(baseResponse);
            }
            else
            {
                context.Result = new JsonResult(apiError);
            }

            base.OnException(context);
        }
    }

}
