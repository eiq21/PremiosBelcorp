using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Agents.LDAP.Request
{
    public class ValidateUserRequest
    {
        public string Username { get; set; }
        public string Password { get; set; }
    }
}
