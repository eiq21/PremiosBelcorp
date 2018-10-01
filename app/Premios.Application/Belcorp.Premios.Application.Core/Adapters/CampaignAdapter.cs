using Belcorp.Premios.Infrastructure.CrossCutting.DTO;
using Belcorp.Premios.Infrastructure.Data.Entity.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Application.Core.Adapters
{
    public class CampaignAdapter : ICampaignAdapter
    {
         
        public Campaign FromCampaniaToCampaign(Campania campania)
        {
            if (campania == null)
            {
                return null;
            }

            return new Campaign() {
                CampaignId = campania.CampaniaId,
                Description = campania.Descripcion,
                Active = campania.Activo
            };
        }

        public Campania FromCampaignToCampania(Campaign campaign)
        {

            if (campaign == null)
            {
                return null;
            }

            return new Campania()
            {
                CampaniaId = campaign.CampaignId,
                Descripcion = campaign.Description,
                Activo = campaign.Active
            };
        }
    }
}
