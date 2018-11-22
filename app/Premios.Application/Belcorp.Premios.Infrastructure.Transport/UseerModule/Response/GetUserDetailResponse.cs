using Belcorp.Premios.Infrastructure.CrossCutting.DTO;
using Belcorp.Premios.Infrastructure.Transport.Common;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Transport.UseerModule.Response
{
    public class GetUserDetailResponse : BaseResponse
    {
        public UserDetailProfile UserDetailProfile { get; set; }
    }
}
