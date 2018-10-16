using System;
using System.Collections.Generic;

namespace Belcorp.Premios.Infrastructure.CrossCutting.DTO
{
    public class Campaign
    {

        public int CampaignId { get; set; }
        public string Description { get; set; }
        public bool Active { get; set; }
        public string CreatedUser { get; set; }
        public DateTime CreatedDate { get; set; }
        public string LastModifiedUser { get; set; }
        public DateTime? LastModifiedDate { get; set; }

        public ICollection<CampaignUrl> CampaignUrls { get; set; }
        public ICollection<Team> Team { get; set; }

    }
}
