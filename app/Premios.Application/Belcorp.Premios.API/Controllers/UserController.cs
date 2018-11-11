using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belcorp.Premios.Application.Context.AuthenticationModule.Service;
using Belcorp.Premios.Infrastructure.Transport.UseerModule.Request;
using Belcorp.Premios.Infrastructure.Transport.UseerModule.Response;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Belcorp.Premios.API.Controllers
{
    public class UserController : BaseController
    {
        private IAuthenticationAppService _authenticationAppService;

        public UserController(IAuthenticationAppService authenticationAppService)
        {
            this._authenticationAppService = authenticationAppService;
        }

        [HttpPost]
        public IActionResult GetUserDetail([FromBody] GetUserDetailRequest getUserDetailRequest)
        {
            if (getUserDetailRequest == null || string.IsNullOrEmpty(getUserDetailRequest.UserCode))
            {
                return BadRequest("Debe enviar el codigo del usuario");
            }

            return Ok(new GetUserDetailResponse() {
                UserDetailProfile = 
                _authenticationAppService.getDetailProfile(getUserDetailRequest.UserCode) });
        }
    }
}
