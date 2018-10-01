using Belcorp.Premios.Application.Context.MaintenanceModule.Service;
using Belcorp.Premios.Infrastructure.Transport.MaintenanceModule.Request;
using Belcorp.Premios.Infrastructure.Transport.MaintenanceModule.Response;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Belcorp.Premios.API.Controllers
{
    public class CampaignController : BaseController
    {
        private readonly ICampaignAppService _campaigAnppService;

        public CampaignController(ICampaignAppService campaigAnppService)
        {
            _campaigAnppService = campaigAnppService;
        }



        [HttpPost]
        public InsertCampaignResponse InsertCampaign([FromBody]InsertCampaignRequest insertProcessRequest)
        {
            return new InsertCampaignResponse
            {
                Campaign = _campaigAnppService.InsertCampaign(insertProcessRequest.Campaign)
            };
        }

        [HttpPost]
        public IActionResult ListCampaignByPage([FromBody] ListCampaignByPageRequest ListCampaignByPage)
        {

            return Ok(new ListCampaignByPageResponse {
                Campaigns = _campaigAnppService.ListCampaignByPage(ListCampaignByPage.ListCampaignByPageFilterParameter, ListCampaignByPage.PagedParameter)
            });

        }
    }
}
