using System;
using System.Collections.Generic;

namespace Belcorp.Premios.Infrastructure.CrossCutting.DTO
{
    public class DetailByTeam
    {
        public int TeamId { get; set; }
        public string Name { get; set; }
        public string Synopsis { get; set; }
        public string Protagonists { get; set; }
        public string ValueUrl { get; set; }
        public int? VotationId { get; set; }
        public int? Vote { get; set; }
    }
}
