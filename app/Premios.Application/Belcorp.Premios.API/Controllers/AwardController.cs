using Belcorp.Premios.Application.Context.AwardModule.Service;
using Belcorp.Premios.Application.Context.MaintenanceModule.Service;
using Belcorp.Premios.Infrastructure.CrossCutting.DTO;
using Belcorp.Premios.Infrastructure.Transport.MaintenanceModule.Request;
using Belcorp.Premios.Infrastructure.Transport.MaintenanceModule.Response;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Belcorp.Premios.API.Controllers
{
    [Authorize]
    public class AwardController : BaseController
    {
        private readonly IAwardAppService _awardAppService;

        public AwardController(IAwardAppService awardAppService)
        {
            _awardAppService = awardAppService;
        }

        [EnableCors("CorsPolicy")]
        [HttpPost]
        public IActionResult ListBannersByCampaign([FromBody]ListBannersByCampaignRequest listBannersByCampaignRequest)
        {
            return Ok(new ListBannersByCampaignResponse
            {
                CampaignUrl = _awardAppService.ListBannersByCampaign()
            });
        }

        [EnableCors("CorsPolicy")]
        [HttpPost]
        public IActionResult ListTiles()
        {
            return Ok(new ListTilesResponse
            {
                Tiles = _awardAppService.ListTiles()
            });
        }

        [EnableCors("CorsPolicy")]
        [HttpPost]
        public IActionResult ListDetailByTeam([FromBody]ListDetailByTeamRequest listDetailByTeamRequest)
        {
            return Ok(new ListDetailResponse
            {
                Detail = _awardAppService.ListDetailByTeam(listDetailByTeamRequest.TeamId, listDetailByTeamRequest.CodeUser)
            });
        }

        [EnableCors("CorsPolicy")]
        [HttpPost]
        public IActionResult InsertVotation([FromBody]InsertVotationRequest InsertVotationRequest)
        {

            InsertVotation insertVotation = new InsertVotation() {
                TeamId = InsertVotationRequest.TeamId,
                UserCode = InsertVotationRequest.UserCode,
                Value = InsertVotationRequest.Value
            };

            return Ok(new InsertVotationResponse
            {
                Votation = _awardAppService.InsertVotation(insertVotation)
            });
        }

        [EnableCors("CorsPolicy")]
        [HttpPost]
        public IActionResult UpdateVotation([FromBody]UpdateVotationRequest UpdateVotationRequest)
        {

            UpdateVotation updateVotation = new UpdateVotation()
            {
                TeamId = UpdateVotationRequest.TeamId,
                UserCode = UpdateVotationRequest.UserCode,
                Value = UpdateVotationRequest.Value,
                VotationId = UpdateVotationRequest.VotationId
            };

            return Ok(new UpdateVotationResponse
            {
                Votation = _awardAppService.UpdateVotation(updateVotation)
            });
        }

        [EnableCors("CorsPolicy")]
        [HttpPost]
        public IActionResult ListSuggestionsForUser([FromBody]ListSuggetionsRequest ListSuggetionsRequest)
        {
            return Ok(new ListSuggestionsResponse
            {
                Suggestions = _awardAppService.ListSuggestionsForUser(ListSuggetionsRequest.CodeUser)
            });
        }
    }
}

