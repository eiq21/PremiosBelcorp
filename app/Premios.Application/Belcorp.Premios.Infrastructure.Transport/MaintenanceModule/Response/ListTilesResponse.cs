using Belcorp.Premios.Infrastructure.CrossCutting.DTO;
using Belcorp.Premios.Infrastructure.Transport.Common;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Transport.MaintenanceModule.Response
{
    public class ListTilesResponse : BaseResponse
    {
        public ICollection<Tiles> Tiles { get; set; }
        public ListTilesResponse()
        {
            Tiles = new List<Tiles>();
        }
    }
}
