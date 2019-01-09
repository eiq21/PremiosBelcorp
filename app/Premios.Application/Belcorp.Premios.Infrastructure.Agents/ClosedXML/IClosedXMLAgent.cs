
using Belcorp.Premios.Infrastructure.Agents.ClosedXML.Request;
using Belcorp.Premios.Infrastructure.Agents.ClosedXML.Response;
using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.Agents.ClosedXML
{
    public interface IClosedXMLAgent
    {
        ImportCampaignResponse ImportCampaign(ImportCampaignRequest importCampaignRequest, string userName);
        ImportTeamResponse ImportTeam(ImportTeamRequest importTeamRequest, string userName);
        ExportRankingReportResponse ExportRankingReport(ExportRankingReportRequest exportRankingReportRequest, string templateRoot);
    }
}
