using Belcorp.Premios.Application.Context.AuthenticationModule.Service;
using Belcorp.Premios.Infrastructure.Transport.AuthenticationModule.Request;
using Belcorp.Premios.Infrastructure.Transport.AuthenticationModule.Response;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Belcorp.Premios.Security.API.Controllers
{
    public class AuthenticationController : BaseController
    {
        private readonly IAuthenticationAppService _authenticationAppService;

        public AuthenticationController(IAuthenticationAppService authenticationAppService)
        {
            _authenticationAppService = authenticationAppService;
        }

        [HttpPost]
        public ValidateUserResponse ValidateUser([FromBody]ValidateUserRequest validateUserRequest)
        {
            return new ValidateUserResponse
            {
                isAuthenticated = _authenticationAppService.ValidateUser(validateUserRequest.Username, validateUserRequest.Password)
            };
        }
    }
}
