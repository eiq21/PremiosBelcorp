import { ConnectTokenRequest, GetDetailRequest, ChangePasswordRequest } from "./request";
//import { ValidateUserResponse, ListUsersByPageResponse, ListSystemProfileResponse, ListUsersLDAPResponse, ListGrantedAccessesByUsernameResponse, InsertUserResponse, GetUserByUsernameResponse, GetUserByIdResponse, DeleteUserResponse, UpdateUserResponse, ListUsersBySystemProfileResponse, ListUserGrantedAccessesByUsernameResponse, ConnectTokenResponse, DeleteSystemProfileResponse, ListSystemProfilesByPageResponse, ListGrantedAccessesResponse, InsertSystemProfileResponse, UpdateSystemProfileResponse, GetSystemProfileByPerfilIdResponse } from "./response";
import { ConnectTokenResponse, GetDetailResponse, ChangePasswordResponse } from "./response";
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
  private awardUrl: string;

  constructor(private networkManager: NetworkManager,
    storageService: StorageService,
    configurationService: ConfigurationService) {

    //this.securityUrl = storageService.retrieve(Constants.SistemaUrl.SECURITY_URL);
    this.identityUrl = storageService.retrieve(Constants.SistemaUrl.IDENTITY_URL);
    this.awardUrl = storageService.retrieve(Constants.SistemaUrl.AWARD_URL);

    if (configurationService.isReady) {
      //this.securityUrl = configurationService.securityUrl;
      this.identityUrl = configurationService.identityUrl;
      this.awardUrl = configurationService.awardUrl;
    }
    else {
      //configurationService.settingsLoaded$.subscribe(x => this.securityUrl = configurationService.securityUrl);
      configurationService.settingsLoaded$.subscribe(x => this.identityUrl = configurationService.identityUrl);
      configurationService.settingsLoaded$.subscribe(x => this.awardUrl = configurationService.awardUrl);
    }
  }

  ConnectToken(connectTokenRequest: ConnectTokenRequest): Observable<ConnectTokenResponse> { 
    let postParameters: PostParameters = new PostParameters(); 

    postParameters.PathOperation = this.identityUrl + PathOperation.ConnectToken;
    postParameters.RequestParameter = connectTokenRequest; 

    return this.networkManager.IdentityServerPost(postParameters) as Observable<ConnectTokenResponse>;
  }

  GetUserDetail(getDetailRequest: GetDetailRequest): Observable<GetDetailResponse> {
    let postParameters: PostParameters = new PostParameters(); 

    postParameters.PathOperation = this.awardUrl + PathOperation.GetUserDetail; 
    postParameters.RequestParameter = getDetailRequest;  

    return this.networkManager.Post(postParameters) as Observable<GetDetailResponse>;

  }

  ChangePassword(changePasswordRequest: ChangePasswordRequest): Observable<ChangePasswordResponse> {
    let postParameters: PostParameters = new PostParameters(); 

    postParameters.PathOperation = this.awardUrl + PathOperation.ChangePassword;
    postParameters.RequestParameter = changePasswordRequest;

    return this.networkManager.Post(postParameters) as Observable<ChangePasswordResponse>;

  }

}
