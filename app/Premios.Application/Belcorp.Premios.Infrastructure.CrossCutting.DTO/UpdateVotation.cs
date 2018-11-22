using System;
using System.Collections.Generic;

namespace Belcorp.Premios.Infrastructure.CrossCutting.DTO
{
    public class UpdateVotation
    {
        public int VotationId { get; set; }
        public int TeamId { get; set; }
        public string UserCode { get; set; }
        public int Value { get; set; }
    }
}
