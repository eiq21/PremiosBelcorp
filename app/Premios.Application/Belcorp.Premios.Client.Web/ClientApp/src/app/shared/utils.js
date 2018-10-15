"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
//export class CustomRouterStateSerializer
//  implements RouterStateSerializer<RouterStateUrl> {
//  serialize(routerState: RouterStateSnapshot): RouterStateUrl {
//    let route = routerState.root;
//    while (route.firstChild) {
//      route = route.firstChild;
//    }
//    const { url, root: { queryParams } } = routerState;
//    const { params } = route;
//    return { url, params, queryParams };
//  }
//}
var Functions = /** @class */ (function () {
    function Functions() {
    }
    Functions.getCurrentAbsoluteSiteUrl = function () {
        if (window
            && "location" in window
            && "protocol" in window.location
            && "pathname" in window.location
            && "host" in window.location) {
            return window.location.protocol + "//" + window.location.host + window.location.pathname;
        }
        return null;
    };
    Functions.getWebServerRelativeUrl = function () {
        if (window
            && "location" in window
            && "pathname" in window.location) {
            return window.location.pathname.replace(/\/$/, "");
        }
        return null;
    };
    Functions.getAbsoluteDomainUrl = function () {
        if (window
            && "location" in window
            && "protocol" in window.location
            && "host" in window.location) {
            return window.location.protocol + "//" + window.location.host;
        }
        return null;
    };
    Functions.base64ToArrayBuffer = function (base64) {
        var binaryString = window.atob(base64);
        var binaryLen = binaryString.length;
        var bytes = new Uint8Array(binaryLen);
        for (var i = 0; i < binaryLen; i++) {
            var ascii = binaryString.charCodeAt(i);
            bytes[i] = ascii;
        }
        return bytes;
    };
    Functions.FileFromByteArray = function (fileName, contentType, byte) {
        // It is necessary to create a new blob object with mime-type explicitly set
        // otherwise only Chrome works like it should
        var newBlob = new Blob([byte], { type: contentType });
        // IE doesn't allow using a blob object directly as link href
        // instead it is necessary to use msSaveOrOpenBlob
        if (window.navigator && window.navigator.msSaveOrOpenBlob) {
            window.navigator.msSaveOrOpenBlob(newBlob);
            return;
        }
        // For other browsers: 
        // Create a link pointing to the ObjectURL containing the blob.
        var data = window.URL.createObjectURL(newBlob);
        var link = document.createElement('a');
        link.href = data;
        link.download = fileName;
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
        setTimeout(function () {
            // For Firefox it is necessary to delay revoking the ObjectURL
            window.URL.revokeObjectURL(data);
        });
    };
    ;
    return Functions;
}());
exports.Functions = Functions;
var Constants = /** @class */ (function () {
    function Constants() {
    }
    var _a, _b, _c, _d, _e, _f, _g, _h, _j;
    Constants.IdentityServer = (_a = /** @class */ (function () {
            function class_1() {
            }
            return class_1;
        }()),
        _a.API_RESOURCE_SECURITY = "apiSecurity",
        _a.API_RESOURCE_AWARDS = "apiAwards",
        _a.API_RESOURCE_SECURITY_SCOPE = "apiSeguridadscope",
        _a.API_RESOURCE_AWARDS_SCOPE = "apiAwardsscope",
        _a.CLIENT_ID = "client",
        _a.CLIENT_TOKEN_ID = "resourceownerclient",
        _a.GRANT_TYPE = "password",
        _a);
    Constants.IdentityServerResource = (_b = /** @class */ (function () {
            function class_2() {
            }
            return class_2;
        }()),
        _b.RESOURCE_OWNER_CLIENT_SECRET = "resourceOwnerClientSecret",
        _b);
    Constants.IdentityValidation = (_c = /** @class */ (function () {
            function class_3() {
            }
            return class_3;
        }()),
        _c.INVALID_USERNAME_OR_PASSWORD = "invalid_username_or_password",
        _c.INVALID_CLIENT = "invalid_client",
        _c);
    Constants.MensajeNotificacion = (_d = /** @class */ (function () {
            function class_4() {
            }
            return class_4;
        }()),
        _d.PROTOCOL_TYPE = "pnoti",
        _d.PROTOCOL_PAYLOAD = "The notification has been sent",
        _d);
    Constants.Routes = (_e = /** @class */ (function () {
            function class_5() {
            }
            return class_5;
        }()),
        _e.LOGIN = "/security/login",
        _e.HOME = "/awards/list",
        _e);
    Constants.SistemaUrl = (_f = /** @class */ (function () {
            function class_6() {
            }
            return class_6;
        }()),
        _f.IDENTITY_URL = "identityUrl",
        _f.AWARD_URL = "awardUrl",
        _f);
    Constants.MensajeSistema = (_g = /** @class */ (function () {
            function class_7() {
            }
            return class_7;
        }()),
        _g.SESION_EXPIRADA = "Lo sentimos pero su sesión ha expirado",
        _g.ERROR_INESPERADO_CONTACTE_ADMINISTRADOR_SISTEMAS = "Error Inesperado, contacte al administrador de sistemas",
        _g.USUARIO_PASSWORD_INCORRECTOS = "Usuario y/o password incorrectos",
        _g.CONFIGURACION_INCORRECTA_IDENTITY_SERVER = "La configuración con el servidor de identidad es incorrecta",
        _g);
    Constants.TipoMensajeIcono = (_h = /** @class */ (function () {
            function class_8() {
            }
            return class_8;
        }()),
        _h.OK = "1",
        _h.INFORMATION = "2",
        _h.WARNING = "3",
        _h.ERROR = "4",
        _h);
    Constants.ParametrosPremios = (_j = /** @class */ (function () {
            function class_9() {
            }
            return class_9;
        }()),
        _j.ANCHOBALDOSAS = 6,
        _j.ALTOBALDOSAS = 4,
        _j);
    return Constants;
}());
exports.Constants = Constants;
//# sourceMappingURL=utils.js.map