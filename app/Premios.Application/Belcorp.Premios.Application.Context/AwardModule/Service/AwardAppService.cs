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

namespace Belcorp.Premios.Application.Context.AwardModule.Service
{
    public class AwardAppService : IAwardAppService
    {
        private readonly IUnitOfWork<PremiosContext> _unitOfWork;
        private readonly IRepository<Campaign> _campaignRepository;
        private readonly IRepository<CampaignUrl> _campaignUrlRepository;
        private readonly IRepository<TypeUrl> _typeUrlRepository;
        private readonly ICampaignAdapter _campaignAdapter;
        //private readonly ICampaignAdapter _campaignAdapter;

        public AwardAppService(
            IUnitOfWork<PremiosContext> unitOfWork
        ) {
            _unitOfWork = unitOfWork;
            _campaignRepository = _unitOfWork.GetRepository<Campaign>();
            _campaignUrlRepository = _unitOfWork.GetRepository<CampaignUrl>();
            _typeUrlRepository = _unitOfWork.GetRepository<TypeUrl>();
        }

        public ICollection<CampaignUrl> ListBannersByCampaign() //int campaignId
        {
            int? activeCampaign = (from cu in _unitOfWork.DbContext.CampaniaUrl
                                where cu.Activo == true && cu.Eliminado == false
                                select cu.CampaniaId).FirstOrDefault();

            var query = (from cu in _unitOfWork.DbContext.CampaniaUrl
                         join c in _unitOfWork.DbContext.Campania on cu.CampaniaId equals c.CampaniaId
                         join t in _unitOfWork.DbContext.TipoUrl on cu.TipoUrlId equals t.TipoUrlId
                         where cu.CampaniaId == activeCampaign
                         select new CampaignUrl()
                         {
                              CampaignUrlId = cu.CampaniaUrlId,
                              TypeUrlId = cu.TipoUrlId,
                              ValueUrl = cu.ValorUrl,
                              Description = cu.Descripcion                            
                         });
            //where c.CampaignId);
            var lstCampaignUrl = query.ToList();

            return lstCampaignUrl;
        }
    }
}
