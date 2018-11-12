using Belcorp.Premios.Infrastructure.CrossCutting.DTO;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Agents.ClosedXML.Request
{
    public class ImportTeamRequest
    {
        public IFormFile file { get; set; }
    }
}
