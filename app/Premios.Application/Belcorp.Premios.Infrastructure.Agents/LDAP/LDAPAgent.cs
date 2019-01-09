using Belcorp.Premios.Infrastructure.Agents.LDAP.Request;
using Belcorp.Premios.Infrastructure.Agents.LDAP.Respose;
using Belcorp.Premios.Infrastructure.CrossCutting.AppSettingModel;
using Microsoft.Extensions.Options;
using Novell.Directory.Ldap;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Agents.LDAP
{
    public class LDAPAgent : ILDAPAgent
    {

        private readonly LdapConfig _config;

        public LDAPAgent(IOptions<LdapConfig> config)
        {
            _config = config.Value;
        }
 
        public ValidateUserResponse ValidateUser(ValidateUserRequest validateUserRequest)
        {
            bool isLoginTrue = false;

            LdapConnection ldapConn = new LdapConnection();
            try
            {
                ldapConn.Connect(_config.Host, _config.Port);
                ldapConn.Bind(validateUserRequest.Username + _config.Domain, validateUserRequest.Password);
                isLoginTrue = true;
            }
            catch (Exception)
            {
                //grabar el log de errores
            }

            
            return new ValidateUserResponse() { isLoginTrue = isLoginTrue };
        }

    
    }
}
