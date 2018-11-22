using Belcorp.Premios.Infrastructure.CrossCutting.DTO;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Agents.ClosedXML.Response
{
    public class ExportRankingReportResponse
    {
        public CustomFile ExcelFile { get; set; }
    }
}
