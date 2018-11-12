using Belcorp.Premios.Infrastructure.Transport.Common;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Transport.UseerModule.Response
{
    public class ChangePasswordResponse : BaseResponse
    {
        public bool Status { get; set; }
        public string Message { get; set; }

    }
}
