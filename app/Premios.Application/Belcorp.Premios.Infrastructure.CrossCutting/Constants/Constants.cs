using System;
using System.Collections.Generic;
using System.Text;

namespace Belcorp.Premios.Infrastructure.CrossCutting.Constants
{
    public static class Constants
    {

        public static class IdentityServer
        {
            public const string API_RESOURCE_SECURITY = "apiSecurity";
            public const string API_RESOURCE_PROTOCOLS = "apiProtocols";

            public const string API_RESOURCE_SECURITY_SCOPE = "apiSeguridadscope";
            public const string API_RESOURCE_PROTOCOLS_SCOPE = "apiProtocolsscope";

            public const string CLIENT_ID = "client";
            public const string CLIENT_TOKEN_ID = "resourceownerclient";
        }

        public static class CodigoMensaje
        {
            public const string USUARIO_NO_EXISTE = "NoExisteUsuario";


        }

        public static class TipoError
        {
            public const string DOMINIO = "DOMAIN";
            public const string APP = "APP";
        }
    }
}
