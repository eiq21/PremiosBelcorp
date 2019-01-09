using Belcorp.Premios.Infrastructure.Agents.ClosedXML.Request;
using Belcorp.Premios.Infrastructure.Agents.ClosedXML.Response;
using Belcorp.Premios.Infrastructure.CrossCutting.DTO;
using Belcorp.Premios.Infrastructure.CrossCutting.Extensions;
using global::ClosedXML.Excel;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Security.Claims;
using System.Text;


namespace Belcorp.Premios.Infrastructure.Agents.ClosedXML
{
    public class ClosedXMLAgent : IClosedXMLAgent
    {

        public ImportCampaignResponse ImportCampaign(ImportCampaignRequest importCampaignRequest, string userName)
        {
            List<ImportCampaign> lstCampaign = new List<ImportCampaign>();
            List<ImportCampaignUrl> lstCampaignUrls = new List<ImportCampaignUrl>();

            ImportCampaign objCampaign = null;
            ImportCampaignUrl objCampaignUrl = null;
            var file = importCampaignRequest.file;
            var wkCampaign = new XLWorkbook(file.OpenReadStream());

            #region Sheet Campania
            var wsCampania = wkCampaign.Worksheet(1);

            DataTable dtCampania = wsCampania.RangeUsed().AsTable().AsNativeDataTable();

            objCampaign = new ImportCampaign();
            objCampaign.CampaniaId = Convert.ToInt32(dtCampania.Rows[0].ItemArray.GetValue(0));
            objCampaign.Descripcion = dtCampania.Rows[0].ItemArray.GetValue(1).ToString();
            objCampaign.UsuarioCreacion = userName;
            objCampaign.FechaCreacion = DateTime.Now;
            objCampaign.UsuarioModificacion = userName;
            objCampaign.FechaModificacion = DateTime.Now;


            lstCampaign.Add(objCampaign);
            #endregion

            #region Sheet Campania URLs
            var wsCampaniaUrl = wkCampaign.Worksheet(2);

            DataTable dtCampaniaUrl = wsCampaniaUrl.RangeUsed().AsTable().AsNativeDataTable();

            foreach (DataRow row in dtCampaniaUrl.Rows)
            {

                var nombreUrl = row.ItemArray.GetValue(1).ToString();
                int secuencial = 0;
                if (nombreUrl == "Banner Video de Inicio")
                {
                    secuencial = 1;
                }
                else if (nombreUrl == "Banner imagen de Informacion de los Premios")
                {
                    secuencial = 2;
                }
                else if (nombreUrl == "Banner Video de Ganadores Anteriores")
                {
                    secuencial = 3;
                }
                else if (nombreUrl == "Banner imagen para Movil")
                {
                    secuencial = 4;
                }
                else {
                    secuencial = 0;
                }
                

                objCampaignUrl = new ImportCampaignUrl();
                objCampaignUrl.CampaniaId = Convert.ToInt32(row.ItemArray.GetValue(0));
                objCampaignUrl.TipoUrlId = secuencial;
                objCampaignUrl.ValorUrl = row.ItemArray.GetValue(2).ToString();
                objCampaignUrl.Descripcion = row.ItemArray.GetValue(3).ToString();
                objCampaignUrl.Activo = true;
                objCampaignUrl.Eliminado = false;
                objCampaignUrl.UsuarioCreacion = userName;
                objCampaignUrl.FechaCreacion = DateTime.Now;
                objCampaignUrl.UsuarioModificacion = userName;
                objCampaignUrl.FechaModificacion = DateTime.Now;

                lstCampaignUrls.Add(objCampaignUrl);
            }

            #endregion

            return new ImportCampaignResponse()
            {
                Campaigns = lstCampaign,
                CampaignUrls = lstCampaignUrls
            };
        }

        public ImportTeamResponse ImportTeam(ImportTeamRequest importTeamRequest, string userName)
        {
            List<ImportTeam> lstTeam = new List<ImportTeam>();
            List<ImportTeamUrl> lstTeamUrls = new List<ImportTeamUrl>();

            ImportTeam objTeam = null;
            ImportTeamUrl objTeamUrl = null;
            var file = importTeamRequest.file;
            var wkTeam = new XLWorkbook(file.OpenReadStream());

            #region Sheet Equipos
            var wsCampania = wkTeam.Worksheet(1);

            DataTable dtTeam = wsCampania.RangeUsed().AsTable().AsNativeDataTable();
            foreach (DataRow row in dtTeam.Rows)
            {
                objTeam = new ImportTeam();
                objTeam.EquipoId = Convert.ToInt32(row.ItemArray.GetValue(0));
                objTeam.CampaniaId = Convert.ToInt32(row.ItemArray.GetValue(1));
                objTeam.Nombre = row.ItemArray.GetValue(2).ToString();
                objTeam.Descripcion = row.ItemArray.GetValue(3).ToString();
                objTeam.Sinopsis = row.ItemArray.GetValue(4).ToString();
                objTeam.Protagonistas = row.ItemArray.GetValue(5).ToString();
                objTeam.Activo = true;
                objTeam.Eliminado = false;
                objTeam.UsuarioCreacion = userName;
                objTeam.FechaCreacion = DateTime.Now;
                objTeam.UsuarioModificacion = userName;
                objTeam.FechaModificacion = DateTime.Now;

                lstTeam.Add(objTeam);
            }
            #endregion

            #region Sheet Equipos URLs
            var wsTeamUrl = wkTeam.Worksheet(2);

            DataTable dtTeamUrl = wsTeamUrl.RangeUsed().AsTable().AsNativeDataTable();

            foreach (DataRow row in dtTeamUrl.Rows)
            {

                var nombreUrl = row.ItemArray.GetValue(1).ToString();
                int secuencial = 0;
                if (nombreUrl == "Video para Baldosa")
                {
                    secuencial = 5;
                }
                else if (nombreUrl == "Foto para Baldosa")
                {
                    secuencial = 6;
                }
                else if (nombreUrl == "Video de Historia (largo)")
                {
                    secuencial = 7;
                }
                else if (nombreUrl == "Foto para Sugerencias")
                {
                    secuencial = 8;
                }
                else
                {
                    secuencial = 0;
                }


                objTeamUrl = new ImportTeamUrl();
                objTeamUrl.EquipoId = Convert.ToInt32(row.ItemArray.GetValue(0));
                objTeamUrl.TipoUrlId = secuencial;
                objTeamUrl.ValorUrl = row.ItemArray.GetValue(2).ToString();
                objTeamUrl.UsuarioCreacion = userName;
                objTeamUrl.FechaCreacion = DateTime.Now;
                objTeamUrl.UsuarioModificacion = userName;
                objTeamUrl.FechaModificacion = DateTime.Now;

                lstTeamUrls.Add(objTeamUrl);
            }

            #endregion

            return new ImportTeamResponse()
            {
                Teams = lstTeam,
                TeamUrls = lstTeamUrls
            };
        }

        public ExportRankingReportResponse ExportRankingReport(ExportRankingReportRequest exportRankingReportRequest, string templateRoot) {

            var dtRankingReport = exportRankingReportRequest.rankingReports.ToTable();
            var wkReport = new XLWorkbook(templateRoot);

            wkReport.Worksheet(1).Cell(6, 1).InsertData(dtRankingReport);

            MemoryStream oMemoryStream = new MemoryStream();
            wkReport.SaveAs(oMemoryStream);

            CustomFile excelFile = new CustomFile();
            excelFile.FileName = "Reporte historias PB.xlsx";
            excelFile.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            excelFile.FileContents = oMemoryStream.ToArray();

            return new ExportRankingReportResponse()
            {
                ExcelFile = excelFile
            };

        }

    }
}
