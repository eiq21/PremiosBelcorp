using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.CrossCutting.DTO
{
    public class Votation
    {
        public int VotationId { get; set; }
        public int TeamId { get; set; }
        public string UserCode { get; set; }
        public int Value { get; set; }
        public string CreatedUser { get; set; }
        public DateTime CreatedDate { get; set; }
        public string LastModifiedUser { get; set; }
        public DateTime? LastModifiedDate { get; set; }
    }
}
