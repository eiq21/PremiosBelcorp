using Belcorp.Premios.Infrastructure.CrossCutting.DTO;
using Belcorp.Premios.Infrastructure.Data.Entity.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Application.Core.Adapters
{
    public interface ICampaignAdapter
    {
        Campaign FromCampaniaToCampaign(Campania campania);
        Campania FromCampaignToCampania(Campaign campaign);
    }
}
