using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Data.Entity.Domain
{
    public class Equipo
    {
        public Equipo()
        {
            EquipoUrls = new HashSet<EquipoUrl>();
        }
        public int EquipoId { get; set; }
        public int CampaniaId { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public string Sinopsis { get; set; }
        public string Protagonistas { get; set; }
        public bool Activo { get; set; }
        public bool Eliminado { get; set; }
        public string UsuarioCreacion { get; set; }
        public DateTime FechaCreacion { get; set; }
        public string UsuarioModificacion { get; set; }
        public DateTime FechaModificacion { get; set; }

        public Campania Campania { get; set; }
        public ICollection<EquipoUrl> EquipoUrls { get; set; }
    }
}
