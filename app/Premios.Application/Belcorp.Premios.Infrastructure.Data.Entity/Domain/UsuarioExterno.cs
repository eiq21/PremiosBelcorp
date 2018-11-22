using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Data.Entity.Domain
{
    public class UsuarioExterno
    {
        public int UsuarioExternoId { get; set; }
        public string NroDocumento { get; set; }
        public string NombreCompleto { get; set; }
        public byte[] Clave { get; set; }
        public bool Activo { get; set; }
        public bool Eliminado { get; set; }
        public string UsuarioCreacion { get; set; }
        public DateTime FechaCreacion { get; set; }
        public string UsuarioModificacion { get; set; }
        public DateTime FechaModificacion { get; set; }
    }
}
