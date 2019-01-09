using Belcorp.Premios.Application.Context.MaintenanceModule.Service;
using Belcorp.Premios.Infrastructure.CrossCutting.DTO;
using Belcorp.Premios.Infrastructure.Data.Context;
using Belcorp.Premios.Infrastructure.Transport.MaintenanceModule.Request;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using Belcorp.Premios.Application.Core.Adapters;
using Belcorp.Premios.Infrastructure.Data.Entity.Domain;

namespace Belcorp.Premios.Application.Context.MaintenanceModule.Service
{
    public class CampaignAppService : ICampaignAppService
    {
        private readonly IUnitOfWork<PremiosContext> _unitOfWork;
        private readonly ICampaignAdapter _campaignAdapter;
        
        public CampaignAppService(
            IUnitOfWork<PremiosContext> unitOfWork,
            ICampaignAdapter campaignAdapter)
        {
            _unitOfWork = unitOfWork;
            _campaignAdapter = campaignAdapter;
        }

        public bool ChangeStatusCampaign(Campaign campaign)
        {
            throw new NotImplementedException();
        }

        public Campaign InsertCampaign(Campaign campaign)
        {
            Campania campania = _campaignAdapter.FromCampaignToCampania(campaign);
            _unitOfWork.DbContext.Campania.Add(campania);
            _unitOfWork.SaveChanges();
            return _campaignAdapter.FromCampaniaToCampaign(campania);
        }

        public List<Campaign> ListCampaign()
        {
            throw new NotImplementedException();
        }

        public IPagedList<Campaign> ListCampaignByPage(ListCampaignByPageFilterParameter listCampaignByPageFilterParameter, PagedParameter pagedParameter)
        {
            var query = from p in _unitOfWork.DbContext.Campania
                        where !p.Eliminado
                        orderby p.Descripcion ascending
                        select new Campaign()
                        {
                            CampaignId = p.CampaniaId,
                            Active = p.Activo,
                            Description = p.Descripcion
                        };

            if (listCampaignByPageFilterParameter != null
                && !string.IsNullOrEmpty(listCampaignByPageFilterParameter.Description))
            {
                query = query.Where(w => w.Description.Contains(listCampaignByPageFilterParameter.Description));
            }

            var pagelist = query.ToPagedList(pagedParameter.PageIndex, pagedParameter.PageSize);

            return pagelist;
        }

     }
}
