import { Injectable } from "@angular/core";
import { HttpClient, HttpHeaders, HttpRequest } from "@angular/common/http";
import { Observable } from "rxjs";
import { BaseResponse } from "../core/base-response";
import { PostParameters } from "./post-parameters";
//import { MatDialog } from "@angular/material";
//import { Overlay } from "@angular/cdk/overlay";
//import { MessageboxDialogComponent } from "../../modules/core/components/messagebox/messagebox-dialog.component";
import { Constants } from "../../shared/utils";
import { ConnectTokenResponse } from "../security/response/index";
import { ConfigurationService } from "../../services/configuration.service";
import { StorageService } from "../../services/storage.service";

@Injectable()
export class NetworkManager { 

  private resourceOwnerClientSecret: string; 

  constructor(
    private httpClient: HttpClient,
    //private messagebox: MatDialog,
    //private overlay: Overlay,
    storageService: StorageService,
    configurationService: ConfigurationService) {

    this.resourceOwnerClientSecret = storageService.retrieve(Constants.IdentityServerResource.RESOURCE_OWNER_CLIENT_SECRET);

    if (configurationService.isReady) {
      this.resourceOwnerClientSecret = configurationService.resourceOwnerClientSecret;
    }
    else {
      configurationService.settingsLoaded$.subscribe(x => this.resourceOwnerClientSecret = configurationService.resourceOwnerClientSecret);
    }
  }

  Post(postParameters: PostParameters): Observable<BaseResponse> {

    const headers = new HttpHeaders({ 'content-type': 'application/json' });
    const options = { headers: headers };
    var parameters = postParameters.RequestParameter || null;
    let _self = this;

    console.log("aqui va:");
    console.log(parameters);

    return Observable.create(observer => {     

      this.httpClient.post(`${postParameters.PathOperation}`, JSON.stringify(parameters), options)
        .subscribe((data) => {

          try {
            let response: BaseResponse = <BaseResponse>data;
            if (response.StateResponse.HasError) {
              observer.error(response);
            } else {
              observer.next(data);
            }
          } catch (e) {
            observer.error(e);
          } finally {
            observer.complete();
          }
        }, error => this.ErrorHandler(error, _self));
    });
  }

  PostFile(pathOperation: string, formData: FormData): Observable<BaseResponse> {
    const headers = new HttpHeaders({ 'Accept': 'application/json' });
    const options = { headers: headers };

    let _self = this;

    return Observable.create(observer => { 

      this.httpClient.post(`${pathOperation}`, formData, options)
        .subscribe((data) => {

          try {
            let response: BaseResponse = <BaseResponse>data; 
            if (response.StateResponse.HasError) {
              observer.error(response);
            } else {
              observer.next(data);
            }
          } catch (e) {
            observer.error(e);
          } finally {
            observer.complete();
          }
        }, error => this.ErrorHandler(error, _self));
    });
  }

  IdentityServerPost(postParameters: PostParameters): Observable<BaseResponse> {
    const headers = new HttpHeaders({ 'content-type': 'application/x-www-form-urlencoded' });
    const options = { headers: headers }

    var parameters = postParameters.RequestParameter || null;
    let _self = this;

    let body = new URLSearchParams();
    body.set('grant_type', Constants.IdentityServer.GRANT_TYPE);
    body.set('client_id', Constants.IdentityServer.CLIENT_TOKEN_ID);
    body.set('client_secret', this.resourceOwnerClientSecret);
    body.set('scope', Constants.IdentityServer.API_RESOURCE_AWARDS + " "  + Constants.IdentityServer.API_RESOURCE_SECURITY);
    body.set('username', postParameters.RequestParameter.username); 
    body.set('password', postParameters.RequestParameter.password);

    //console.log(body);
    //console.log(options);

    return Observable.create(observer => {
      this.httpClient.post(`${postParameters.PathOperation}`, body.toString(), options)
        .subscribe((data : ConnectTokenResponse) => {
          try {
            let response: ConnectTokenResponse = <ConnectTokenResponse>data;
            if (data.access_token) {
              observer.next(response);
            } else {
              observer.error(Constants.MensajeSistema.ERROR_INESPERADO_CONTACTE_ADMINISTRADOR_SISTEMAS);
            }
          } catch (e) {
            observer.error(e);
          } finally {
            observer.complete();
          }
        }, error => {
          if (error.status === 400 && error.error.error_description == Constants.IdentityValidation.INVALID_USERNAME_OR_PASSWORD) {
            observer.error(Constants.MensajeSistema.USUARIO_PASSWORD_INCORRECTOS);
            observer.complete();
          }
          else if (error.status === 400 && error.error.error == Constants.IdentityValidation.INVALID_CLIENT) {
            observer.error(Constants.MensajeSistema.CONFIGURACION_INCORRECTA_IDENTITY_SERVER);
            observer.complete();
          }
          else {
            this.ErrorHandler(error, _self);
            observer.error(Constants.MensajeSistema.ERROR_INESPERADO_CONTACTE_ADMINISTRADOR_SISTEMAS);
            observer.complete();
          }
        });
      });
  }

  ErrorHandler(error, _self) {
    if (error.status != 401) {
      console.error('CUSTOM ERROR');
      console.log(error);
      //_self.openMessagebox('Protocolo', Constants.MensajeSistema.ERROR_INESPERADO_CONTACTE_ADMINISTRADOR_SISTEMAS, '4');
    }
  }

  //openMessagebox(title, messagetext, imgIcon, btnAceptar = true, btnCancelar = false): void {
  //  let messageboxRef = this.messagebox.open(MessageboxDialogComponent, {
  //    //scrollStrategy: this.overlay.scrollStrategies.noop(),
  //    disableClose: true,
  //    data: {
  //      messageTitle: title,
  //      messageBoxTxt: messagetext,
  //      messageBoxIcon: imgIcon,
  //      messageBoxBtnAceptar: btnAceptar,
  //      messageBoxBtnCancelar: btnCancelar,
  //      buttons: [
  //        { textButton: 'Aceptar' },
  //        { textButton: 'Cancelar' }
  //      ]
  //    }
  //  });

    //messageboxRef.afterClosed().subscribe(idButton => {
    //  if (idButton == 1) {
    //    //accion del boton 1
    //  }
    //  if (idButton == 2) {
    //    //accion del boton 2          
    //  }
    //});
 }
