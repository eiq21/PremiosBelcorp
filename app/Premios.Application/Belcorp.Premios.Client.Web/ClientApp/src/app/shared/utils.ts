import { RouterStateSerializer } from '@ngrx/router-store';
import { RouterStateSnapshot, Params } from '@angular/router';

export interface RouterStateUrl {
  url: string;
  params: Params;
  queryParams: Params;
}

export class CustomRouterStateSerializer
  implements RouterStateSerializer<RouterStateUrl> {
  serialize(routerState: RouterStateSnapshot): RouterStateUrl {
    let route = routerState.root;

    while (route.firstChild) {
      route = route.firstChild;
    }

    const { url, root: { queryParams } } = routerState;
    const { params } = route;

    return { url, params, queryParams };
  }
}

export class Functions {

  public static getCurrentAbsoluteSiteUrl(): string {
    if (window
      && "location" in window
      && "protocol" in window.location
      && "pathname" in window.location
      && "host" in window.location) {
      return window.location.protocol + "//" + window.location.host + window.location.pathname;
    }
    return null;
  }

  public static getWebServerRelativeUrl(): string {
    if (window
      && "location" in window
      && "pathname" in window.location) {
      return window.location.pathname.replace(/\/$/, "");
    }
    return null;
  }

  public static getAbsoluteDomainUrl(): string {
    if (window
      && "location" in window
      && "protocol" in window.location
      && "host" in window.location) {
      return window.location.protocol + "//" + window.location.host;
    }
    return null;
  }

  public static base64ToArrayBuffer(base64) {
    var binaryString = window.atob(base64);
    var binaryLen = binaryString.length;
    var bytes = new Uint8Array(binaryLen);
    for (var i = 0; i < binaryLen; i++) {
      var ascii = binaryString.charCodeAt(i);
      bytes[i] = ascii;
    }
    return bytes;
  }

  public static FileFromByteArray(fileName, contentType, byte) {
    // It is necessary to create a new blob object with mime-type explicitly set
    // otherwise only Chrome works like it should
    var newBlob = new Blob([byte], { type: contentType })

    // IE doesn't allow using a blob object directly as link href
    // instead it is necessary to use msSaveOrOpenBlob
    if (window.navigator && window.navigator.msSaveOrOpenBlob) {
      window.navigator.msSaveOrOpenBlob(newBlob);
      return;
    }

    // For other browsers: 
    // Create a link pointing to the ObjectURL containing the blob.
    const data = window.URL.createObjectURL(newBlob);
    var link = document.createElement('a');
    link.href = data;
    link.download = fileName;
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);

    setTimeout(() => {
      // For Firefox it is necessary to delay revoking the ObjectURL
      window.URL.revokeObjectURL(data);
    });
  };
}

export class Constants {

  static IdentityServer = class {
    static readonly API_RESOURCE_SECURITY = "apiSecurity";
    static readonly API_RESOURCE_AWARDS = "apiProtocols";

    static readonly API_RESOURCE_SECURITY_SCOPE = "apiSeguridadscope";
    static readonly API_RESOURCE_AWARDS_SCOPE = "apiAwardsscope";

    static readonly CLIENT_ID = "client";
    static readonly CLIENT_TOKEN_ID = "resourceownerclient";

    static readonly GRANT_TYPE = "password";
  }

  static IdentityServerResource = class {
    static readonly RESOURCE_OWNER_CLIENT_SECRET = "resourceOwnerClientSecret";
  }

  static IdentityValidation = class {
    static readonly INVALID_USERNAME_OR_PASSWORD = "invalid_username_or_password";
    static readonly INVALID_CLIENT = "invalid_client";
  }

  static MensajeNotificacion = class {
    static readonly PROTOCOL_TYPE = "pnoti";
    static readonly PROTOCOL_PAYLOAD = "The notification has been sent";
  }

  static Routes = class {
    static readonly LOGIN = "/security/login";
    static readonly HOME = "/awards";
  }

  static SistemaUrl = class {
    static readonly IDENTITY_URL = "identityUrl";
    static readonly AWARD_URL = "awardUrl";
    //static readonly SECURITY_URL = "securityUrl";
  }

  static MensajeSistema = class {
    static readonly SESION_EXPIRADA = "Lo sentimos pero su sesión ha expirado";
    static readonly ERROR_INESPERADO_CONTACTE_ADMINISTRADOR_SISTEMAS = "Error Inesperado, contacte al administrador de sistemas";
    static readonly USUARIO_PASSWORD_INCORRECTOS = "Usuario y/o password incorrectos";
    static readonly CONFIGURACION_INCORRECTA_IDENTITY_SERVER = "La configuración con el servidor de identidad es incorrecta";
    static readonly NAVEGADOR_INCORRECTO = "¡Oops! Para poder disfrutar las historias debes ingresar desde Google Chrome. ¡Allá nos vemos!";
  }

  
  static TipoMensajeIcono = class {
    static readonly OK = "1";
    static readonly INFORMATION = "2";
    static readonly WARNING = "3";
    static readonly ERROR = "4";
  }

  static ParametrosPremios = class {
    static readonly ANCHOBALDOSAS = 6;
    static readonly ALTOBALDOSAS = 4;
  }

  static TiposUrl = class {
    static readonly BANNER_INICIO = 1;
    static readonly BANNER_INFORMACIONPREMIOS = 2;
    static readonly BANNER_GANADORESANTERIORES = 3;
    static readonly BANNER_MOVIL = 4;
  }
}
