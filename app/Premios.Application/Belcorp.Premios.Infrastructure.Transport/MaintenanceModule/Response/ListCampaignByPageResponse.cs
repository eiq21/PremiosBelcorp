using Belcorp.Premios.Infrastructure.CrossCutting.DTO;
using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;

namespace Belcorp.Premios.Infrastructure.Transport.MaintenanceModule.Response
{
    public class ListCampaignByPageResponse
    {
        public IPagedList<Campaign> Campaigns { get; set; }
    }
}
