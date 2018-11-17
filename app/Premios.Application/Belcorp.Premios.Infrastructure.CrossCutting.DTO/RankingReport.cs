using System;
using System.Collections.Generic;

namespace Belcorp.Premios.Infrastructure.CrossCutting.DTO
{
    public class RankingReport
    {
        public int EquipoId { get; set; }
        public string NombreHistoria { get; set; }
        public string URL { get; set; }
        public int NumeroPersonas { get; set; }
        public int Promedio { get; set; }
        public int Puntaje { get; set; }
    }
}
