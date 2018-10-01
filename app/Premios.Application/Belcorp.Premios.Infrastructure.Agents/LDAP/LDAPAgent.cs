using Belcorp.Premios.Infrastructure.Agents.LDAP.Request;
using Belcorp.Premios.Infrastructure.Agents.LDAP.Respose;
using Microsoft.Extensions.Options;
using Novell.Directory.Ldap;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Agents.LDAP
{
    public class LDAPAgent : ILDAPAgent
    {
        /*
        private readonly LdapService _config;

        public LDAPAgent(IOptions<LdapService> config)
        {
            _config = config.Value;
        }
        */
        /*
        public bool Authenticate(string distinguishedName, string password)
        {
            using (var ldapConnection = new LdapConnection() { SecureSocketLayer = true })
            {
                ldapConnection.Connect(this._ldapSettings.ServerName, this._ldapSettings.ServerPort);

                try
                {
                    ldapConnection.Bind(distinguishedName, password);

                    return true;
                }
                catch (Exception)
                {
                    return false;
                }
            }
        }
        */
        public ValidateUserResponse ValidateUser(ValidateUserRequest validateUserRequest)
        {
            bool isLoginFailed = true;


            /*
            using (DirectoryEntry entry = new DirectoryEntry())
            {
                entry.Path = "LDAP://" + _config.Url;
                // entry.AuthenticationType = AuthenticationTypes.Secure;
                entry.Username = validateUserRequest.Username;
                entry.Password = validateUserRequest.Password;

                DirectorySearcher searcher = new DirectorySearcher(entry);

                searcher.Filter = string.Format(_config.SearchFilter, validateUserRequest.Username);

                try
                {
                    searcher.FindOne();
                    isLoginFailed = true;
                }
                catch (COMException ex)
                {
                    if (ex.ErrorCode == -2147023570)
                    {
                        isLoginFailed = false;
                    }
                    else
                    {
                        throw new ActiveDirectoryException("Error con la validación del Directorio Activo: " + ex.Message);
                    }
                }
            }
            */
            return new ValidateUserResponse() { isLoginFailed = isLoginFailed };
        }

    
    }
}
