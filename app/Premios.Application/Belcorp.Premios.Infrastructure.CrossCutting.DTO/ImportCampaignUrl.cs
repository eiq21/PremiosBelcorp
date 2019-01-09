using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.CrossCutting.DTO
{
    public class ImportCampaignUrl
    {
        public int CampaniaId { get; set; }
        public int TipoUrlId { get; set; }
        public string ValorUrl { get; set; }
        public string Descripcion { get; set; }
        public bool Activo { get; set; }
        public bool Eliminado { get; set; }
        public string UsuarioCreacion { get; set; }
        public DateTime FechaCreacion { get; set; }
        public string UsuarioModificacion { get; set; }
        public DateTime? FechaModificacion { get; set; }

    }
}
