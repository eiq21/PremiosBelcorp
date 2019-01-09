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

namespace Belcorp.Premios.Security.API._Code.ExceptionHandling
{
    public class ApiExceptionFilter : ExceptionFilterAttribute
    {
        private readonly ILogger<ApiExceptionFilter> _Logger;

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
