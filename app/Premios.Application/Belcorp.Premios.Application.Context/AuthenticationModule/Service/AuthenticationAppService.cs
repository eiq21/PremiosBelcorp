using Belcorp.Premios.Domain.Context.SecurityModule;
using Belcorp.Premios.Infrastructure.Agents.LDAP;
using Belcorp.Premios.Infrastructure.Agents.LDAP.Request;
using Belcorp.Premios.Infrastructure.Data.Context;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using Belcorp.Premios.Infrastructure.CrossCutting.Encrypt;
using Belcorp.Premios.Infrastructure.CrossCutting.DTO;
using Belcorp.Premios.Infrastructure.Data.Core.Extensions;

namespace Belcorp.Premios.Application.Context.AuthenticationModule.Service
{
    public class AuthenticationAppService : IAuthenticationAppService
    {
        private readonly ILDAPAgent _ldapAgent;
        private readonly IUnitOfWork<PremiosContext> _unitOfWork;

        public AuthenticationAppService(
            IUnitOfWork<PremiosContext> unitOfWork,
            ILDAPAgent ldapAgent)
        {
            _unitOfWork = unitOfWork;
            _ldapAgent = ldapAgent;
        }

        public UserDetailProfile getDetailProfile(string username)
        {
            UserDetailProfile udp = _unitOfWork.ExecuteSqlQuery<UserDetailProfile>("usp_ConsultaDetalleUsuario", new GetUserDetailParameter() { UserName = username } ).FirstOrDefault();
            return udp;
        }

        public bool ValidateUser(string username, string password)
        {
            bool valid = false;

            var externo = (from x in _unitOfWork.DbContext.UsuarioExterno
                           where x.NroDocumento == username
                           && x.Activo && !x.Eliminado
                           select x).FirstOrDefault();

            if (externo == null || externo.UsuarioExternoId == 0)
            {
                valid = _ldapAgent.ValidateUser(new ValidateUserRequest
                {
                    Username = username,
                    Password = password
                }).isLoginTrue;
            }
            else
            {
                valid = EncryptHelper.Decrypt(externo.Clave) == password;
            }

            return valid;

        }
    }
}
