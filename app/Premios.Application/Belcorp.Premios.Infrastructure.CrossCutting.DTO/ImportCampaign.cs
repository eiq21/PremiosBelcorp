using System;
using System.Collections.Generic;

namespace Belcorp.Premios.Infrastructure.CrossCutting.DTO
{
    public class ImportCampaign
    {
       
        public int CampaniaId { get; set; }
        public string Descripcion { get; set; }
        public bool Activo { get; set; }
        public bool Eliminado { get; set; }
        public string UsuarioCreacion { get; set; }
        public DateTime FechaCreacion { get; set; }
        public string UsuarioModificacion { get; set; }
        public DateTime? FechaModificacion { get; set; }

    }
}
