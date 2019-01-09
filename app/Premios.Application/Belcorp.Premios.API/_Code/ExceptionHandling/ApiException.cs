using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Belcorp.Premios.API._Code.ExceptionHandling
{
    public class ApiException : Exception
    {
        public int StatusCode { get; set; }
    

        public ApiException(Exception ex, int statusCode = 500) : base(ex.Message)
        {
            StatusCode = statusCode;
        }
    }
}
