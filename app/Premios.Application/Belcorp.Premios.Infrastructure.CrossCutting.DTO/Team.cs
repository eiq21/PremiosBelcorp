using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.CrossCutting.DTO
{
    public class Team
    {
        public int TeamId { get; set; }
        public int CampaignId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Synopsis { get; set; }
        public string Protagonists { get; set; }
        public bool Actived { get; set; }
        public bool Deleted { get; set; }
        public string CreatedUser { get; set; }
        public DateTime CreatedDate { get; set; }
        public string LastModifiedUser { get; set; }
        public DateTime? LastModifiedDate { get; set; }

        public Campaign Campaign { get; set; }
    }
}
