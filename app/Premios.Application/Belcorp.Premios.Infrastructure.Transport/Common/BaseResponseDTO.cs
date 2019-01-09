using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Transport.Common
{
    public class BaseResponseDTO
    {
        public bool HasError { get; set; }
        public int? CodigoError { get; set; }
        public string TipoError { get; set; }
        public string MensajeError { get; set; }
    }
}
