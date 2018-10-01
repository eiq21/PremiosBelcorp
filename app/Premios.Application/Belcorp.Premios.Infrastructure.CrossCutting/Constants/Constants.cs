using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.CrossCutting.Constants
{
    public class Constants
    {

        public class IdentityServer
        {
            public const string API_RESOURCE_SECURITY = "apiSecurity";
            public const string API_RESOURCE_PROTOCOLS = "apiProtocols";
            //public const string API_RESOURCE_REPORTS = "apiReports";

            public const string API_RESOURCE_SECURITY_SCOPE = "apiSeguridadscope";
            public const string API_RESOURCE_PROTOCOLS_SCOPE = "apiProtocolsscope";
            //public const string API_RESOURCE_REPORTS_SCOPE = "apiReportsscope";

            public const string CLIENT_ID = "client";
            public const string CLIENT_TOKEN_ID = "resourceownerclient";
        }
        public class CodigoMensaje
        {
            public const string USUARIO_NO_EXISTE = "NoExisteUsuario";


        }

        public class TipoError
        {
            public const string DOMINIO = "DOMAIN";
            public const string APP = "APP";
        }
    }
}
