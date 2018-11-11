using Belcorp.Premios.Infrastructure.Agents.LDAP;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Domain.Context.SecurityModule
{
    public class SecurityService : ISecurityService
    {
        public SecurityService(ILDAPAgent ldapAgent)
        {

        }
        public bool IsAdministrator(string username)
        {
            throw new NotImplementedException();
        }
    }
}
