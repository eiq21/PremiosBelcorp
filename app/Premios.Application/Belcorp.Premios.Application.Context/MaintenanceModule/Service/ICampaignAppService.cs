using Belcorp.Premios.Infrastructure.CrossCutting.DTO;
using Belcorp.Premios.Infrastructure.Transport.MaintenanceModule.Request;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Application.Context.MaintenanceModule.Service
{
    public interface ICampaignAppService
    {
        Campaign InsertCampaign(Campaign campaign);
        bool ChangeStatusCampaign(Campaign campaign);
        IPagedList<Campaign> ListCampaignByPage(ListCampaignByPageFilterParameter listCampaignByPageFilterParameter, PagedParameter pagedParameter);
        List<Campaign> ListCampaign();
    }
}
