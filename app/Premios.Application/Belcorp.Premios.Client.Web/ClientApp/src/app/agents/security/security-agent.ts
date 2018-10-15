import { ConnectTokenRequest } from "./request";
//import { ValidateUserResponse, ListUsersByPageResponse, ListSystemProfileResponse, ListUsersLDAPResponse, ListGrantedAccessesByUsernameResponse, InsertUserResponse, GetUserByUsernameResponse, GetUserByIdResponse, DeleteUserResponse, UpdateUserResponse, ListUsersBySystemProfileResponse, ListUserGrantedAccessesByUsernameResponse, ConnectTokenResponse, DeleteSystemProfileResponse, ListSystemProfilesByPageResponse, ListGrantedAccessesResponse, InsertSystemProfileResponse, UpdateSystemProfileResponse, GetSystemProfileByPerfilIdResponse } from "./response";
import { ConnectTokenResponse } from "./response";
import { NetworkManager, PostParameters } from "../networkmanager";
import { PathOperation } from "./path-operation";
import { Observable } from "rxjs";
import { Injectable } from "@angular/core";
import { Constants } from "../../shared/utils";
import { ConfigurationService } from "../../services/configuration.service";
import { StorageService } from "../../services/storage.service";

@Injectable()
export class SecurityAgent {

  private securityUrl: string;
  private identityUrl: string;

  constructor(private networkManager: NetworkManager,
    storageService: StorageService,
    configurationService: ConfigurationService) {

    //this.securityUrl = storageService.retrieve(Constants.SistemaUrl.SECURITY_URL);
    this.identityUrl = storageService.retrieve(Constants.SistemaUrl.IDENTITY_URL);

    if (configurationService.isReady) {
      //this.securityUrl = configurationService.securityUrl;
      this.identityUrl = configurationService.identityUrl;
    }
    else {
      //configurationService.settingsLoaded$.subscribe(x => this.securityUrl = configurationService.securityUrl);
      configurationService.settingsLoaded$.subscribe(x => this.identityUrl = configurationService.identityUrl);
    }
  }

  ConnectToken(connectTokenRequest: ConnectTokenRequest): Observable<ConnectTokenResponse> { 
    let postParameters: PostParameters = new PostParameters();

    postParameters.PathOperation = this.identityUrl + PathOperation.ConnectToken;
    postParameters.RequestParameter = connectTokenRequest; 

    return this.networkManager.IdentityServerPost(postParameters) as Observable<ConnectTokenResponse>;
  }


}
