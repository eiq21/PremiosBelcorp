using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Data.Entity.Domain
{
    public class EquipoUrl
    {

        public int EquipoUrlId { get; set; }
        public int EquipoId { get; set; }
        public int TipoUrlId { get; set; }
        public string ValorUrl { get; set; }
        public string UsuarioCreacion { get; set; }
        public DateTime FechaCreacion { get; set; }
        public string UsuarioModificacion { get; set; }
        public DateTime FechaModificacion { get; set; }

        public Equipo Equipo { get; set; }
        public TipoUrl TipoUrl { get; set; }
    }
}
