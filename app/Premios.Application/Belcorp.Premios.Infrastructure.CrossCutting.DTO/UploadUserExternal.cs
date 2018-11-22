using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.CrossCutting.DTO
{
    public class UploadUserExternal
    {
        public int IdTrabajador { get; set; }
        public string NombreCompleto { get; set; }
        public string NroDocumento { get; set; }
        public byte[] Clave { get; set; }
    }
}
