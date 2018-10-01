using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Transport.Common
{
    public class BaseResponse
    {
        public BaseResponse()
        {
            StateResponse = new BaseResponseDTO();
        }
        public BaseResponseDTO StateResponse { get; set; }
    }
}
