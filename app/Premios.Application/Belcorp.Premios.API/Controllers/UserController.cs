using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belcorp.Premios.Application.Context.AuthenticationModule.Service;
using Belcorp.Premios.Application.Context.UserModule.Service;
using Belcorp.Premios.Infrastructure.CrossCutting.DTO;
using Belcorp.Premios.Infrastructure.Data.Entity.Domain;
using Belcorp.Premios.Infrastructure.Transport.UseerModule.Request;
using Belcorp.Premios.Infrastructure.Transport.UseerModule.Response;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Belcorp.Premios.API.Controllers
{
    public class UserController : BaseController
    {
        private readonly IAuthenticationAppService _authenticationAppService;
        private readonly IUserExternalModule _userExternalModule;

        public UserController(
            IAuthenticationAppService authenticationAppService,
            IUserExternalModule userExternalModule)
        {
            this._authenticationAppService = authenticationAppService;
            this._userExternalModule = userExternalModule;
        }

        [HttpPost]
        public IActionResult GetUserDetail([FromBody] GetUserDetailRequest getUserDetailRequest)
        {
            if (getUserDetailRequest == null || string.IsNullOrEmpty(getUserDetailRequest.UserCode))
            {
                return BadRequest("Debe enviar el codigo del usuario");
            }

            return Ok(new GetUserDetailResponse()
            {
                UserDetailProfile =
                _authenticationAppService.getDetailProfile(getUserDetailRequest.UserCode)
            });
        }

        [HttpPost]
        public IActionResult ChangePassword([FromBody]  ChangePasswordRequest changePasswordRequest)
        {
            string mensaje = "";
            if (changePasswordRequest == null || string.IsNullOrEmpty(changePasswordRequest.UserCode))
            {
                return BadRequest("Debe enviar el codigo del usuario");
            }

            if (User.Identity.Name != changePasswordRequest.UserCode)
            {
                return BadRequest("Debe ser el mismo usuario autenticado para cambiar la clave");
            }

            bool resp = _userExternalModule.ChangePassword(changePasswordRequest.UserCode, changePasswordRequest.PasswordOld, changePasswordRequest.PasswordNew, ref mensaje);

            var lstChangePassword = new List<ChangePassword>();
            lstChangePassword.Add(new ChangePassword()
            {
                Status = resp,
                Message = mensaje
            });

            return Ok(new ChangePasswordResponse()
            {
                ChangePassword = lstChangePassword
            });
        }

        [HttpPost]
        public IActionResult ChangePasswordAdmin([FromBody]  ChangePasswordAdminRequest changePasswordAdminRequest)
        {
            string mensaje = "";
            if (changePasswordAdminRequest == null || string.IsNullOrEmpty(changePasswordAdminRequest.UserCode))
            {
                return BadRequest("Debe enviar el codigo del usuario");
            }
            if (User.Identity.Name != changePasswordAdminRequest.UserCode)
            {
                return BadRequest("Debe ser el mismo usuario autenticado para cambiar la clave");
            }

            bool resp = _userExternalModule.ChangePasswordAdmin(changePasswordAdminRequest.UserCode, changePasswordAdminRequest.PasswordNew, ref mensaje);

            var lstChangePassword = new List<ChangePassword>();
            lstChangePassword.Add(new ChangePassword()
            {
                Status = resp,
                Message = mensaje
            });

            return Ok(new ChangePasswordResponse()
            {
                ChangePassword = lstChangePassword
            }); 
        }
    }
}
