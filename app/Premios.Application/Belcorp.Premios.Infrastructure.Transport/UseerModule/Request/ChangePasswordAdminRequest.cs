using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Transport.UseerModule.Request
{
    public class ChangePasswordAdminRequest
    {
        public string UserCode { get; set; }
        public string PasswordNew { get; set; }
    }
}
