using Belcorp.Premios.Infrastructure.CrossCutting.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Transport.MaintenanceModule.Request
{
    public class ListDetailByTeamRequest
    {
        public int TeamId { get; set; }
        public string CodeUser { get; set; }
    }
}
