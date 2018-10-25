import { ListTilesResponse, ListBannersResponse, ListDetailResponse, InsertVotationResponse, UpdateVotationResponse } from "./response";
import { NetworkManager, PostParameters } from "../networkmanager";
import { PathOperation } from "./path-operation";
import { Observable } from "rxjs";
import { Injectable } from "@angular/core";
import { Constants } from "../../shared/utils";
import { ConfigurationService } from "../../services/configuration.service";
import { StorageService } from "../../services/storage.service"; 
import { ListDetailRequest, InsertVotationRequest, UpdateVotationRequest } from "./request";

@Injectable()
export class AwardAgent { 

  private awardUrl: string;  

  constructor(private networkManager: NetworkManager, 
    storageService: StorageService,
    configurationService: ConfigurationService) { 

    this.awardUrl = storageService.retrieve(Constants.SistemaUrl.AWARD_URL);

    if (configurationService.isReady)
      this.awardUrl = configurationService.awardUrl;
    else
      configurationService.settingsLoaded$.subscribe(x => this.awardUrl = configurationService.awardUrl);
  }

  ListTiles(): Observable<ListTilesResponse> {
    let postParameters: PostParameters = new PostParameters();

    postParameters.PathOperation = this.awardUrl + PathOperation.ListTiles;
    //postParameters.RequestParameter = listCentersRequest;

    return this.networkManager.Post(postParameters) as Observable<ListTilesResponse>;
  }

  ListBannersByActiveCampaign(): Observable<ListBannersResponse> {
    let postParameters: PostParameters = new PostParameters();

    postParameters.PathOperation = this.awardUrl + PathOperation.ListBannersByCampaign;
    //postParameters.RequestParameter = listCentersRequest;

    return this.networkManager.Post(postParameters) as Observable<ListBannersResponse>;
    
  }

  ListDetailByTeam(listDetailRequest: ListDetailRequest): Observable<ListDetailResponse> {
    let postParameters: PostParameters = new PostParameters();

    postParameters.PathOperation = this.awardUrl + PathOperation.ListDetailByTeam;
    postParameters.RequestParameter = listDetailRequest;

    return this.networkManager.Post(postParameters) as Observable<ListDetailResponse>;

  }

  InsertVotation(insertVotationRequest: InsertVotationRequest): Observable<InsertVotationResponse> {
    let postParameters: PostParameters = new PostParameters();

    postParameters.PathOperation = this.awardUrl + PathOperation.InsertVotation;
    postParameters.RequestParameter = insertVotationRequest;

    return this.networkManager.Post(postParameters) as Observable<InsertVotationResponse>;

  }


  UpdateVotation(updateVotationRequest: UpdateVotationRequest): Observable<UpdateVotationResponse> {
    let postParameters: PostParameters = new PostParameters();

    postParameters.PathOperation = this.awardUrl + PathOperation.UpdateVotation;
    postParameters.RequestParameter = updateVotationRequest;

    return this.networkManager.Post(postParameters) as Observable<UpdateVotationResponse>;

  }

}
