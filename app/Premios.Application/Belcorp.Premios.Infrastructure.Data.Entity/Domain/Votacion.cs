using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Data.Entity.Domain
{
    public class Votacion
    {
        public int VotacionId { get; set; }
        public int EquipoId { get; set; }
        public string CodUsuario { get; set; }
        public int Valor { get; set; }
        public string UsuarioCreacion { get; set; }
        public DateTime FechaCreacion { get; set; }
        public string UsuarioModificacion { get; set; }
        public DateTime? FechaModificacion { get; set; }

        public Equipo Equipo { get; set; }
        
    }
}
