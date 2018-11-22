using Belcorp.Premios.Infrastructure.CrossCutting.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Agents.ClosedXML.Response
{
    public class ImportTeamResponse
    {
        public List<ImportTeam> Teams { get; set; }
        public List<ImportTeamUrl> TeamUrls { get; set; }
    }
}
