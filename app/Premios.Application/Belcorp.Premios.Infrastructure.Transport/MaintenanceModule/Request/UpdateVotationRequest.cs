using Belcorp.Premios.Infrastructure.CrossCutting.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Transport.MaintenanceModule.Request
{
    public class UpdateVotationRequest
    {
        public int TeamId { get; set; }
        public string UserCode { get; set; }
        public int Value { get; set; }
        public int VotationId { get; set; }
    }
}
