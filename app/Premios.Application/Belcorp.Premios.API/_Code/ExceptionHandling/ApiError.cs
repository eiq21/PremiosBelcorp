﻿using Microsoft.AspNetCore.Mvc.ModelBinding;
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
        //public bool isError { get; set; }
        public string detail { get; set; }
        //public object data { get; set; }

        //public ValidationErrorCollection errors { get; set; }

        public ApiError(string message)
        {
            this.message = message;
        }

        public ApiError(ModelStateDictionary modelState)
        {
            //this.isError = true;
            if (modelState != null && modelState.Any(m => m.Value.Errors.Count > 0))
            {
                message = "Please correct the specified errors and try again.";
                //errors = modelState.SelectMany(m => m.Value.Errors).ToDictionary(m => m.Key, m=> m.ErrorMessage);
                //errors = modelState.SelectMany(m => m.Value.Errors.Select( me => new KeyValuePair<string,string>( m.Key,me.ErrorMessage) ));
                //errors = modelState.SelectMany(m => m.Value.Errors.Select(me => new ModelError { FieldName = m.Key, ErrorMessage = me.ErrorMessage }));
            }
        }
    }
}
