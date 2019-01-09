using Microsoft.AspNetCore.Mvc.ModelBinding;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Belcorp.Premios.API._Code.ExceptionHandling
{
    public class ApiError
    {
        public string message { get; set; }
        public string errorType { get; set; }
        public string detail { get; set; }

        public ApiError(string message)
        {
            this.message = message;
        }

        public ApiError(ModelStateDictionary modelState)
        {
            if (modelState != null && modelState.Any(m => m.Value.Errors.Count > 0))
            {
                message = "Please correct the specified errors and try again.";
            }
        }
    }
}
