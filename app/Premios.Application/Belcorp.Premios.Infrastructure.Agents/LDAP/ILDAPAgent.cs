using Belcorp.Premios.Infrastructure.Agents.LDAP.Request;
using Belcorp.Premios.Infrastructure.Agents.LDAP.Respose;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Agents.LDAP
{
    public interface ILDAPAgent
    {
        ValidateUserResponse ValidateUser(ValidateUserRequest validateUserRequest);
    }
}
