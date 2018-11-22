using Belcorp.Premios.Infrastructure.CrossCutting.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Application.Context.UserModule.Service
{
    public interface IUserExternalModule
    {
        bool UploadUserExternal(string dataExternal, bool eliminaAnterior, string usuario, ref string mensaje);
        bool ChangePassword(string nroDocumento, string claveActual, string claveNueva, ref string mensaje);
        bool ChangePasswordAdmin(string nroDocumento, string claveNueva, ref string mensaje);
    }
}
