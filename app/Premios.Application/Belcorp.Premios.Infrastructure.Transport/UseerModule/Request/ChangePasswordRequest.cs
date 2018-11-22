using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Transport.UseerModule.Request
{
    public class ChangePasswordRequest
    {
        public string UserCode { get; set; }
        public string PasswordOld { get; set; }
        public string PasswordNew { get; set; }
    }
}
