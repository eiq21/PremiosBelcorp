using Belcorp.Premios.Infrastructure.CrossCutting.DTO;
using Belcorp.Premios.Infrastructure.Transport.Common;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Transport.MaintenanceModule.Response
{
    public class ListBannersByCampaignResponse : BaseResponse
    {
        public ICollection<CampaignUrl> CampaignUrl { get; set; }
        public ListBannersByCampaignResponse()
        {
            CampaignUrl = new List<CampaignUrl>();
        }
    }
}
