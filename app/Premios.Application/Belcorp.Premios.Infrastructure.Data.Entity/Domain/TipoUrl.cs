using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Data.Entity.Domain
{
    public class TipoUrl
    {
        public TipoUrl()
        {

            CampaniaUrls = new HashSet<CampaniaUrl>();
        }

        public int TipoUrlId { get; set; }
        public string Nombre { get; set; }
        public bool Activo { get; set; }
        public string UsuarioCreacion { get; set; }
        public DateTime FechaCreacion { get; set; }
        public string UsuarioModificacion { get; set; }
        public DateTime? FechaModificacion { get; set; }


        public ICollection<CampaniaUrl> CampaniaUrls { get; set; }
    }
}
