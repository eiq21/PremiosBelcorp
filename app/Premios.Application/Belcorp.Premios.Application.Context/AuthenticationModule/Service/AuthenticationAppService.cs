using Belcorp.Premios.Domain.Context.SecurityModule;
using Belcorp.Premios.Infrastructure.Agents.LDAP;
using Belcorp.Premios.Infrastructure.Agents.LDAP.Request;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Application.Context.AuthenticationModule.Service
{
    public class AuthenticationAppService : IAuthenticationAppService
    {
        private readonly ILDAPAgent _ldapAgent;
        private readonly ISecurityService _securityService;

        public AuthenticationAppService(
            ISecurityService securityService,
            ILDAPAgent ldapAgent)
        {
            _ldapAgent = ldapAgent;
        }

        public bool IsAdministrator(string username)
        {
            //throw new NotImplementedException();
            
            return true;
        }

        public bool ValidateUser(string username, string password)
        {
            // Solo valida si existe en al AD
            return _ldapAgent.ValidateUser(new ValidateUserRequest
            {
                Username = username,
                Password = password
            }).isLoginTrue;
           
             
        }
    }
}
