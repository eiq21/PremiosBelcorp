using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using Belcorp.Premios.Infrastructure.Data.Entity.Domain;
using Belcorp.Premios.Infrastructure.CrossCutting.Encrypt;
using Belcorp.Premios.Infrastructure.Data.Context;
using Belcorp.Premios.Infrastructure.CrossCutting.DTO;
using Microsoft.EntityFrameworkCore;
using Belcorp.Premios.Infrastructure.CrossCutting.Extensions;
using System.Data;
using Belcorp.Premios.Infrastructure.Data.Core.Extensions;
namespace Belcorp.Premios.Application.Context.UserModule.Service
{
    public class UserExternalModule : IUserExternalModule
    {

        private readonly IRepository<UserExternal> _userExternalRepository;
        private readonly IUnitOfWork<PremiosContext> _unitOfWork;

        public UserExternalModule(IUnitOfWork<PremiosContext> unitOfWork)
        {
            _unitOfWork = unitOfWork;
            _userExternalRepository = _unitOfWork.GetRepository<UserExternal>();
        }

        public bool GetUserExternal(string nroDocumento)
        {
            throw new NotImplementedException();
        }

        public bool UploadUserExternal(string dataExternal, bool eliminaAnterior, string usuario, ref string mensaje)
        {
            bool response = false;
            List<string> data = dataExternal.Split(
                new[] { "\r\n", "\r", "\n" },
                StringSplitOptions.None).ToList();

            if (data.Count() <= 0)
            {
                mensaje = "El archivo no tiene lineas";
                return response;
            }

            var bugs = (from x in data
                       where x.Split(",").Length != 2
                       select x).ToList();

            if (bugs != null && bugs.Count() > 0)
            {
                mensaje = "Existen registro con valores errados";
                return response;
            }

            List<UsuarioExterno> usuariosEx = new List<UsuarioExterno>();
            
            List< UploadUserExternal> uploadUserExternal = data.Select((b, index) => new UploadUserExternal
            {
                IdTrabajador = index + 1,
                NombreCompleto = b.Split(",")[0],
                NroDocumento = b.Split(",")[1],
                Clave = EncryptHelper.EncryptToByte(b.Split(",")[1].ToString())
            }).ToList();

            DataTable dtuploadUserExternal = uploadUserExternal.ToTable();

            UploadUserExternalParameter uuep = new UploadUserExternalParameter()
            {
                EliminaDatoAnterior = eliminaAnterior,
                FechaProceso = DateTime.Now,
                DataUsuarioExterno = dtuploadUserExternal,
                UsuarioProceso = usuario
            };

            _unitOfWork.ExecuteSqlNonQuery("usp_CargaUsuarioExterno", uuep);
            return true;
        }
    }
}

