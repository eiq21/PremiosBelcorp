using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Transport.AuthenticationModule.Response
{
    public class ValidateUserResponse
    {

        public string Token { get; set; }
        public bool isAuthenticated { get; set; }
    }
}
