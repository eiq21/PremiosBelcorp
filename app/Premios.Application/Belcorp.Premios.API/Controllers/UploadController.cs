using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Belcorp.Premios.Application.Context.UserModule.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Belcorp.Premios.API.Controllers
{
    public class UploadController : BaseController
    {
        private IUserExternalModule _userExternalModule;

        public UploadController(IUserExternalModule userExternalModule)
        {
            this._userExternalModule = userExternalModule;
        }


        [HttpPost]
        public IActionResult UploadUserExternal(IFormFile file, bool removePrevious = false)
        {
            if (file == null || file.Length <= 0)
            {
                return BadRequest("Debe adjuntar el archivo");
            }

            if (file.ContentType != "text/csv")
            {
                return BadRequest("Debe adjuntar un archivo separado por comas (CSV)");
            }

            var caller = User as ClaimsPrincipal;
            if (!caller.HasClaim("admin", "True"))
            {
                return BadRequest("Usuario no tiene permiso de carga");
            }
            
            Stream sm = file.OpenReadStream();
            //FileStream ms = new FileStream(file.OpenReadStream());
            string archivo = "";
            using (StreamReader sr = new StreamReader(sm, System.Text.Encoding.Default, true))
            {
                archivo = sr.ReadToEnd();
            }

            

            string mensaje = "";
            bool resp = _userExternalModule.UploadUserExternal(archivo, removePrevious, User.Identity.Name, ref mensaje);

            return Ok(new
            {
                result = resp,
                mensaje
            });
        }

    }
}
