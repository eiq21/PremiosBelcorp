using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Data.Entity.Domain
{
    public class CampaniaUrl
    {
        public int CampaniaUrlId { get; set; }
        public int CampaniaId { get; set; }
        public int TipoUrlId { get; set; }
        public string ValorUrl { get; set; }
        public string Descripcion { get; set; }
        public bool Activo { get; set; }
        public bool Eliminado { get; set; }
        public string UsuarioCreacion { get; set; }
        public DateTime FechaCreacion { get; set; }
        public string UsuarioModificacion { get; set; }
        public DateTime? FechaModificacion { get; set; }

        public Campania Campania { get; set; }
        public TipoUrl TipoUrl { get; set; }

    }
}
