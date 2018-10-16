using Belcorp.Premios.Application.Context.AwardModule.Service;
using Belcorp.Premios.Application.Context.MaintenanceModule.Service;
using Belcorp.Premios.Infrastructure.Transport.MaintenanceModule.Request;
using Belcorp.Premios.Infrastructure.Transport.MaintenanceModule.Response;
using Microsoft.AspNetCore.Authorization;
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

        [HttpPost]
        public IActionResult ListBannersByCampaign([FromBody]ListBannersByCampaignRequest listBannersByCampaignRequest)
        {
            return Ok(new ListBannersByCampaignResponse
            {
                CampaignUrl = _awardAppService.ListBannersByCampaign()
            });
        }

        [HttpPost]
        public IActionResult ListTiles()
        {
            return Ok(new ListTilesResponse
            {
                Tiles = _awardAppService.ListTiles()
            });
        }
    }
}

