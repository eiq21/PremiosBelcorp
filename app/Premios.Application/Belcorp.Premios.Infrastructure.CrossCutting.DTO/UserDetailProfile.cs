using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.CrossCutting.DTO
{
    public class UserDetailProfile
    {
        public string UserCode { get; set; }
        public string Name { get; set; }
        public bool IsAdministrator { get; set; }
        public bool IsExternal { get; set; }
    }
}
