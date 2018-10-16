using Belcorp.Premios.Infrastructure.CrossCutting.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Application.Context.AwardModule.Service
{
    public interface IAwardAppService
    {
        ICollection<CampaignUrl> ListBannersByCampaign();
        ICollection<Tiles> ListTiles();
    }
}
