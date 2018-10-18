﻿using Belcorp.Premios.Application.Context.MaintenanceModule.Service;
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

        private int? GetActiveCampaign()
        {
            int? activeCampaign = (from cu in _unitOfWork.DbContext.CampaniaUrl
                                   where cu.Activo == true && cu.Eliminado == false
                                   select cu.CampaniaId).FirstOrDefault();

            return activeCampaign;
        }

        public ICollection<CampaignUrl> ListBannersByCampaign() //int campaignId
        {
            int? activeCampaign = this.GetActiveCampaign();

            var query = (from cu in _unitOfWork.DbContext.CampaniaUrl
                         join c in _unitOfWork.DbContext.Campania on cu.CampaniaId equals c.CampaniaId
                         join t in _unitOfWork.DbContext.TipoUrl on cu.TipoUrlId equals t.TipoUrlId
                         where cu.CampaniaId == activeCampaign.Value
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

        public ICollection<Tiles> ListTiles()
        {
            int? activeCampaign = this.GetActiveCampaign();
            int[] typesUrl = new int[] { 6, 7 };
            List<Tiles> lstTiles = new List<Tiles>();
            //List<int> lstTeamsUsed = new List<int>();
            Tiles objTile = null;

            var resultBase = (from e in _unitOfWork.DbContext.Equipo
                         join eq in _unitOfWork.DbContext.EquipoUrl on e.EquipoId equals eq.EquipoId
                         where typesUrl.Contains(eq.TipoUrlId) && e.CampaniaId == activeCampaign.Value
                         select new
                         {
                             //TeamUrlId = eq.EquipoUrlId,
                             TeamId = e.EquipoId,
                             TypeUrlId = eq.TipoUrlId,
                             Name = e.Nombre,
                             Description = e.Descripcion,
                             ValueUrl = eq.ValorUrl
                         }).ToList();
            //GroupBy(x => x.TeamId).SelectMany(t => t).OrderBy(x => Guid.NewGuid()).ThenBy(x => x.TeamId);
            //
            foreach (var tile in resultBase)
            {
                objTile = new Tiles();

                var t = lstTiles.Where(x => x.TeamId == tile.TeamId);

                if (!t.Any())
                {
                    objTile.TeamId = tile.TeamId;
                    objTile.TypeUrlId = tile.TypeUrlId;
                    objTile.Name = tile.Name;
                    objTile.Description = tile.Name;
                    if (tile.TypeUrlId == 6) {
                        objTile.VideoPreviewValueUrl = tile.ValueUrl;
                    }

                    if (tile.TypeUrlId == 7) {
                        objTile.ImageValueUrl = tile.ValueUrl;
                    }

                    lstTiles.Add(objTile);
                }
                else
                {
                    var obj = t.FirstOrDefault();
                    if (tile.TypeUrlId == 6)
                    {
                        obj.VideoPreviewValueUrl = tile.ValueUrl;
                    }

                    if (tile.TypeUrlId == 7)
                    {
                        obj.ImageValueUrl = tile.ValueUrl;
                    }
                }               

            }


            return lstTiles.OrderBy(x => Guid.NewGuid()).ToList();

        }
     }
}