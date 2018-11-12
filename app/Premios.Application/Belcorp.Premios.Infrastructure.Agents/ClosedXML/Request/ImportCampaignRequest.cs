using Belcorp.Premios.Infrastructure.CrossCutting.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Agents.ClosedXML.Request
{
    public class ImportCampaignRequest
    {
        public ICollection<ImportCampaign> Campaigns { get; set; }
    }
}
