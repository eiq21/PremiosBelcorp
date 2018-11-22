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
using Microsoft.EntityFrameworkCore.ChangeTracking;
using Belcorp.Premios.Infrastructure.Agents.ClosedXML;
using Belcorp.Premios.Infrastructure.Agents.ClosedXML.Request;
using Microsoft.AspNetCore.Http;
using Belcorp.Premios.Infrastructure.Agents.ClosedXML.Response;
using Belcorp.Premios.Infrastructure.CrossCutting.Extensions;
using Belcorp.Premios.Infrastructure.Data.Core.Extensions;
using Belcorp.Premios.Infrastructure.CrossCutting.Enums;
using System.IO;

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
        private readonly IClosedXMLAgent _closedXMLAgent;

        public AwardAppService(
            IUnitOfWork<PremiosContext> unitOfWork,
            IClosedXMLAgent closedXMLAgent
        ) {
            _unitOfWork = unitOfWork;
            _campaignRepository = _unitOfWork.GetRepository<Campaign>();
            _campaignUrlRepository = _unitOfWork.GetRepository<CampaignUrl>();
            _typeUrlRepository = _unitOfWork.GetRepository<TypeUrl>();
            _closedXMLAgent = closedXMLAgent;
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
                         where cu.CampaniaId == activeCampaign.Value && c.Activo == true && c.Eliminado == false &&
                               cu.Activo == true && cu.Eliminado == false
                         select new CampaignUrl()
                         {
                             CampaignUrlId = cu.CampaniaUrlId,
                             TypeUrlId = cu.TipoUrlId,
                             Sequential = t.Secuencial,
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
            int[] typesUrl = new int[] { (int)Enums.TiposUrl.VideoBaldosa, (int)Enums.TiposUrl.FotoBaldosa };
            List<Tiles> lstTiles = new List<Tiles>();
            //List<int> lstTeamsUsed = new List<int>();
            Tiles objTile = null;

            var resultBase = (from e in _unitOfWork.DbContext.Equipo
                         join eq in _unitOfWork.DbContext.EquipoUrl on e.EquipoId equals eq.EquipoId
                         join t in _unitOfWork.DbContext.TipoUrl on eq.TipoUrlId equals t.TipoUrlId
                         where typesUrl.Contains(t.Secuencial) && e.CampaniaId == activeCampaign.Value
                         select new
                         {
                             //TeamUrlId = eq.EquipoUrlId,
                             TeamId = e.EquipoId,
                             TypeUrlId = eq.TipoUrlId,
                             Name = e.Nombre,
                             Description = e.Descripcion,
                             ValueUrl = eq.ValorUrl,
                             Sequential = t.Secuencial
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
                    objTile.Sequential = tile.Sequential;
                    objTile.Name = tile.Name;
                    objTile.Description = tile.Description;
                    if (tile.Sequential == (int)Enums.TiposUrl.VideoBaldosa) {
                        objTile.VideoPreviewValueUrl = tile.ValueUrl;
                    }

                    if (tile.Sequential == (int)Enums.TiposUrl.FotoBaldosa) {
                        objTile.ImageValueUrl = tile.ValueUrl;
                    }

                    lstTiles.Add(objTile);
                }
                else
                {
                    var obj = t.FirstOrDefault();
                    if (tile.Sequential == (int)Enums.TiposUrl.VideoBaldosa)
                    {
                        obj.VideoPreviewValueUrl = tile.ValueUrl;
                    }

                    if (tile.Sequential == (int)Enums.TiposUrl.FotoBaldosa)
                    {
                        obj.ImageValueUrl = tile.ValueUrl;
                    }
                }               

            }


            return lstTiles.OrderBy(x => Guid.NewGuid()).ToList();

        }

        public ICollection<DetailByTeam> ListDetailByTeam(int teamId, string codeUser) //int campaignId
        {
            int? activeCampaign = this.GetActiveCampaign();

            var query = (from e in _unitOfWork.DbContext.Equipo
                         join eu in _unitOfWork.DbContext.EquipoUrl on e.EquipoId equals eu.EquipoId
                         join t in _unitOfWork.DbContext.TipoUrl on eu.TipoUrlId equals t.TipoUrlId
                         join v in _unitOfWork.DbContext.Votacion.Where(x => x.CodUsuario == codeUser)
                               on eu.EquipoId equals v.EquipoId
                         into vl
                         from vlj in vl.DefaultIfEmpty()
                         where e.CampaniaId == activeCampaign.Value &&
                               t.Secuencial == (int)Enums.TiposUrl.VideoHistoria && e.Activo == true && e.Eliminado == false
                               && e.EquipoId == teamId
                        select new DetailByTeam()
                         {
                             TeamId = e.EquipoId,
                             Name = e.Nombre,
                             Protagonists = e.Protagonistas,
                             Synopsis = e.Sinopsis,
                             ValueUrl = eu.ValorUrl,
                             Vote = vlj.Valor,
                             VotationId = vlj.VotacionId

                        });
            //where c.CampaignId);
            var lstTeamDetail = query.ToList();

            return lstTeamDetail;
        }

        public Votation InsertVotation(InsertVotation insertVotation)
        {
            Votacion objVotacion = new Votacion() {
                EquipoId = insertVotation.TeamId,
                CodUsuario = insertVotation.UserCode,
                Valor = insertVotation.Value,
                FechaCreacion = DateTime.Now,
                UsuarioCreacion = insertVotation.UserCode
            };

            EntityEntry<Votacion> votacionResult = _unitOfWork.DbContext.Votacion.Add(objVotacion);

            _unitOfWork.SaveChanges();

            var votation = votacionResult.Entity;

            Votation objVotation = new Votation()
            {
                VotationId = votation.VotacionId,
                TeamId = votation.EquipoId,
                UserCode = votation.CodUsuario,
                Value = votation.Valor,
                CreatedUser = votation.UsuarioCreacion,
                CreatedDate = votation.FechaCreacion
            };

            return objVotation;

        }

        public Votation UpdateVotation(UpdateVotation updateVotation)
        {
            Votacion objVotacion = new Votacion()
            {
                VotacionId = updateVotation.VotationId,
                EquipoId = updateVotation.TeamId,
                CodUsuario = updateVotation.UserCode,
                Valor = updateVotation.Value
            };

            EntityEntry<Votacion> votacionResult = _unitOfWork.DbContext.Votacion.Update(objVotacion);

            _unitOfWork.SaveChanges();

            var votation = votacionResult.Entity;

            Votation objVotation = new Votation()
            {
                VotationId = votation.VotacionId,
                TeamId = votation.EquipoId,
                UserCode = votation.CodUsuario,
                Value = votation.Valor,
                LastModifiedUser = votation.UsuarioModificacion,
                LastModifiedDate = votation.FechaModificacion
            };

            return objVotation;

        }

        public ICollection<Suggestions> ListSuggestionsForUser(string codeUser)
        {
            int? activeCampaign = this.GetActiveCampaign();

            var query = (from e in _unitOfWork.DbContext.Equipo
                         join eu in _unitOfWork.DbContext.EquipoUrl on e.EquipoId equals eu.EquipoId
                         join v in _unitOfWork.DbContext.Votacion
                               on eu.EquipoId equals v.EquipoId
                         into vl
                         from vlj in vl.DefaultIfEmpty()
                         where e.CampaniaId == activeCampaign.Value && 
                         eu.TipoUrlId == 10 && e.Activo == true && e.Eliminado == false && vlj.CodUsuario != codeUser
                         select new Suggestions()
                         {
                             TeamId = e.EquipoId,
                             Name = e.Nombre,
                             Description = e.Descripcion,
                             ValueUrl = eu.ValorUrl
                         });

            var lstSuggestions = query.Distinct().OrderBy(x => Guid.NewGuid()).Take(3).ToList();

            return lstSuggestions;
        }

        public bool ImportCampaign(IFormFile file, string userName)
        {
            ImportCampaignResponse importCampaignResponse = new ImportCampaignResponse();
            var importFile = new ImportCampaignRequest()
            {
                file = file
            };

            importCampaignResponse = _closedXMLAgent.ImportCampaign(importFile, userName);

            importCampaignResponse.CampaignUrls.ForEach(x => {
               x.TipoUrlId = _unitOfWork.DbContext.TipoUrl.Where(t => t.Secuencial == x.TipoUrlId).FirstOrDefault().TipoUrlId;
            });

            UploadCampaign uucp = new UploadCampaign()
            {
                DataCampania = importCampaignResponse.Campaigns.ToTable(),
                DataCampaniaUrls = importCampaignResponse.CampaignUrls.ToTable()
            };

            _unitOfWork.ExecuteSqlNonQuery("usp_CargaCampaniasUrls", uucp);
            return true;

        }

        public bool ImportTeams(IFormFile file, string userName)
        {
            ImportTeamResponse importTeamResponse = new ImportTeamResponse();
            var importFile = new ImportTeamRequest()
            {
                file = file
            };

            importTeamResponse = _closedXMLAgent.ImportTeam(importFile, userName);

            importTeamResponse.TeamUrls.ForEach(x => {
                x.TipoUrlId = _unitOfWork.DbContext.TipoUrl.Where(t => t.Secuencial == x.TipoUrlId).FirstOrDefault().TipoUrlId;
            });

            UploadTeam uut = new UploadTeam()
            {
                DataEquipo = importTeamResponse.Teams.ToTable(),
                DataEquiposUrls = importTeamResponse.TeamUrls.ToTable()
            };

            _unitOfWork.ExecuteSqlNonQuery("usp_CargaEquipoUrls", uut);
            return true;

        }

        public CustomFile RankingReport(string templateRoot) {

            var lstRankingReport = _unitOfWork.ExecuteSqlQuery<RankingReport>("usp_ObtenerRanking", null);

            ExportRankingReportRequest exportRankingReportRequest = new ExportRankingReportRequest()
            {
                rankingReports = lstRankingReport.ToList()
            };

            var exportRankingResponse = _closedXMLAgent.ExportRankingReport(exportRankingReportRequest, templateRoot);

            return exportRankingResponse.ExcelFile;

        }
    }
}
