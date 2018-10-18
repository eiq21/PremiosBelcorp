using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.CrossCutting.AppSettingModel
{
    public class LdapConfig
    {
        public string Host { get; set; }
        public int Port { get; set; }
        public string Domain { get; set; }
    }
}
