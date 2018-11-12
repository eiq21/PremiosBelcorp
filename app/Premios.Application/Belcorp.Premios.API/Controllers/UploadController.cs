using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Belcorp.Premios.Application.Context.AwardModule.Service;
using Belcorp.Premios.Application.Context.UserModule.Service;
using Belcorp.Premios.Infrastructure.Agents.ClosedXML;
using Belcorp.Premios.Infrastructure.Agents.ClosedXML.Request;
using Belcorp.Premios.Infrastructure.CrossCutting.DTO;
using Belcorp.Premios.Infrastructure.Transport.MaintenanceModule.Response;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Belcorp.Premios.API.Controllers
{
    public class UploadController : BaseController
    {
        private IUserExternalModule _userExternalModule;
        private readonly IAwardAppService _awardAppService;

        public UploadController(IUserExternalModule userExternalModule, IAwardAppService awardAppService)
        {
            this._userExternalModule = userExternalModule;
            this._awardAppService = awardAppService;
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

        [HttpPost]
        public IActionResult UploadCampaign(IFormFile file, bool removePrevious = false)
        {
            if (file == null || file.Length <= 0)
            {
                return BadRequest("Debe adjuntar el archivo");
            }

            if (file.ContentType != "application/vnd.ms-excel" && file.ContentType != "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
            {
                return BadRequest("Debe adjuntar un archivo excel (XLSX | XLS)");
            }
            
            var caller = User as ClaimsPrincipal;
            
            if (!caller.HasClaim("admin", "True"))
            {
                return BadRequest("Usuario no tiene permiso de carga");
            }

            var result = _awardAppService.ImportCampaign(file, caller.Identity.Name);

            var fileResult = new UploadFileResult {
                Status = result
            };

            var lstFileResult = new List<UploadFileResult>();
            lstFileResult.Add(fileResult);

            return Ok(new UploadFileResponse()
            {
                UploadFilesResult = lstFileResult
            });
        }


        [HttpPost]
        public IActionResult UploadUrlsTeam(IFormFile file)
        {
            if (file == null || file.Length <= 0)
            {
                return BadRequest("Debe adjuntar el archivo");
            }

            if (file.ContentType != "application/vnd.ms-excel" && file.ContentType != "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
            {
                return BadRequest("Debe adjuntar un archivo excel (XLSX | XLS)");
            }

            var caller = User as ClaimsPrincipal;

            if (!caller.HasClaim("admin", "True"))
            {
                return BadRequest("Usuario no tiene permiso de carga");
            }

            var result = _awardAppService.ImportTeams(file, caller.Identity.Name);


            var fileResult = new UploadFileResult
            {
                Status = result
            };

            var lstFileResult = new List<UploadFileResult>();
            lstFileResult.Add(fileResult);

            return Ok(new UploadFileResponse()
            {
                UploadFilesResult = lstFileResult
            });
        }
    }
}
