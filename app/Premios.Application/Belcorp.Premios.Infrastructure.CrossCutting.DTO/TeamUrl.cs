using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.CrossCutting.DTO
{
    public class TeamUrl
    {
        public int TeamUrlId { get; set; }
        public int TeamId { get; set; }
        public int TypeUrlId { get; set; }
        public string ValueUrl { get; set; }
        public string CreatedUser { get; set; }
        public DateTime CreatedDate { get; set; }
        public string LastModifiedUser { get; set; }
        public DateTime? LastModifiedDate { get; set; }


        public Team Team { get; set; }
        public TypeUrl TypeUrl { get; set; }
    }
}
