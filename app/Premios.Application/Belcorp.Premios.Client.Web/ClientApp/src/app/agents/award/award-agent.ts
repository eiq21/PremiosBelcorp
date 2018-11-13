import { ListTilesResponse, ListBannersResponse, ListDetailResponse, InsertVotationResponse, UpdateVotationResponse, ListSuggestionsResponse, UpdloadCampaignResponse, UpdloadTeamResponse } from "./response";
import { NetworkManager, PostParameters } from "../networkmanager";
import { PathOperation } from "./path-operation";
import { Observable } from "rxjs";
import { Injectable } from "@angular/core";
import { Constants } from "../../shared/utils";
import { ConfigurationService } from "../../services/configuration.service";
import { StorageService } from "../../services/storage.service"; 
import { ListDetailRequest, InsertVotationRequest, UpdateVotationRequest, ListSuggestionsRequest, UploadCampaignRequest, UploadTeamRequest } from "./request";

@Injectable()
export class AwardAgent { 

  private awardUrl: string;  
  private userUrl: string;

  constructor(private networkManager: NetworkManager, 
    storageService: StorageService,
    configurationService: ConfigurationService) { 

    this.awardUrl = storageService.retrieve(Constants.SistemaUrl.AWARD_URL);
    this.userUrl = storageService.retrieve(Constants.SistemaUrl.AWARD_URL);

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

  ListSuggestions(listSuggetionsRequest: ListSuggestionsRequest): Observable<ListSuggestionsResponse> {
    let postParameters: PostParameters = new PostParameters();

    postParameters.PathOperation = this.awardUrl + PathOperation.ListSuggetions;
    postParameters.RequestParameter = listSuggetionsRequest;

    return this.networkManager.Post(postParameters) as Observable<ListSuggestionsResponse>;

  }

  UploadCampaign(uploadCampaignRequest: UploadCampaignRequest): Observable<UpdloadCampaignResponse> {

    let pathOperation = this.awardUrl + PathOperation.UploadCampaign;

    const formData = new FormData();

    formData.append('file', uploadCampaignRequest.File);
    formData.append('removePrevious', uploadCampaignRequest.removePrevious);

    return this.networkManager.PostFile(pathOperation, formData) as Observable<UpdloadCampaignResponse>;
  }


  UploadTeam(uploadTeamRequest: UploadTeamRequest): Observable<UpdloadTeamResponse> {

    let pathOperation = this.awardUrl + PathOperation.UploadTeam;

    const formData = new FormData();

    formData.append('file', uploadTeamRequest.File);

    return this.networkManager.PostFile(pathOperation, formData) as Observable<UpdloadTeamResponse>;
  }



}
