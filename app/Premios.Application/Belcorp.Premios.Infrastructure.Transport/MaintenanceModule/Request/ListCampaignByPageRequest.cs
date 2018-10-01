using Belcorp.Premios.Infrastructure.CrossCutting.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Transport.MaintenanceModule.Request
{
    public class ListCampaignByPageRequest
    {
        public ListCampaignByPageFilterParameter ListCampaignByPageFilterParameter { get; set; }
        public PagedParameter PagedParameter { get; set; }
    }
}
