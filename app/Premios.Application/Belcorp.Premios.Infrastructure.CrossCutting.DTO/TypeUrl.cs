using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.CrossCutting.DTO
{
    public class TypeUrl
    {
        public int TypeUrlId { get; set; }
        public string Name { get; set; }
        public bool Actived { get; set; }
        public int Sequential { get; set; }
        public string CreatedUser { get; set; }
        public DateTime CreatedDate { get; set; }
        public string LastModifiedUser { get; set; }
        public DateTime? LastModifiedDate { get; set; }

        public ICollection<CampaignUrl> CampaignUrls { get; set; }
        public ICollection<TeamUrl> TeamUrls { get; set; }
    }
}
