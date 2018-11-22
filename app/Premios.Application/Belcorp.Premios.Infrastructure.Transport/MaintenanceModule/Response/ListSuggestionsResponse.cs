using Belcorp.Premios.Infrastructure.CrossCutting.DTO;
using Belcorp.Premios.Infrastructure.Transport.Common;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Transport.MaintenanceModule.Response
{
    public class ListSuggestionsResponse : BaseResponse
    {
        public ICollection<Suggestions> Suggestions { get; set; }
        public ListSuggestionsResponse()
        {
            Suggestions = new List<Suggestions>();
        }
    }
}
