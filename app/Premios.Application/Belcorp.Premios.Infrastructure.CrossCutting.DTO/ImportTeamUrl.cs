using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.CrossCutting.DTO
{
    public class ImportTeamUrl
    {
        //public int EquipoUrlId { get; set; }
        public int EquipoId { get; set; }
        public int TipoUrlId { get; set; }
        public string ValorUrl { get; set; }
        public string UsuarioCreacion { get; set; }
        public DateTime FechaCreacion { get; set; }
        public string UsuarioModificacion { get; set; }
        public DateTime FechaModificacion { get; set; }

    }
}
