using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Belcorp.Premios.Infrastructure.CrossCutting.DTO
{
    public class UploadUserExternalParameter
    {
        public DataTable DataUsuarioExterno { get; set; }
        public string UsuarioProceso { get; set; }
        public DateTime FechaProceso { get; set; }
        public bool EliminaDatoAnterior { get; set; }

    }
}
