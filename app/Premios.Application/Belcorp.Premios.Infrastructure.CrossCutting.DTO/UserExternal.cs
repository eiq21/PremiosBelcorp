using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.CrossCutting.DTO
{
    public class UserExternal
    {
        public int UserExternalId { get; set; }
        public string DocumentNumber { get; set; }
        public string Names { get; set; }
        public string Password { get; set; }
        public bool Active { get; set; }
        public string CreatedUser { get; set; }
        public DateTime CreatedDate { get; set; }
        public string LastModifiedUser { get; set; }
        public DateTime? LastModifiedDate { get; set; } 

    }
}
