using Belcorp.Premios.Infrastructure.CrossCutting.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Agents.ClosedXML.Response
{
    public class ImportCampaignResponse
    {
        public List<ImportCampaign> Campaigns { get; set; }
        public List<ImportCampaignUrl> CampaignUrls { get; set; }
    }
}
