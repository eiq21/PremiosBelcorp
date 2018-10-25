using System;
using System.Collections.Generic;

namespace Belcorp.Premios.Infrastructure.CrossCutting.DTO
{
    public class InsertVotation
    {
        public int TeamId { get; set; }
        public string UserCode { get; set; }
        public int Value { get; set; }
     }
}
