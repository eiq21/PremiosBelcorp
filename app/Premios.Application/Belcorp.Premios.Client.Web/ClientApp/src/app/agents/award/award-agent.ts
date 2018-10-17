//import { GetProtocolRequest, ListCentersRequest, ListBulksRequest, ListProcessesRequest, ListEquipmentsByProcessRequest, InsertProtocolHeaderRequest, ListAgitationTypesRequest, InsertProtocolTaskRequest, UpdateProtocolRequest, ListProtocolsByPageRequest, GetProtocolWithDetailsRequest, ListRawMaterialsByProtocolRequest, UpdateProtocolHeaderRequest, ValidateProtocolHeaderRequest, GetBulkWithMaterialsRequest, ApproveFlowRequest, RefuseProtocolRequest, UnsubscribeProtocolRequest, ActivateProtocolRequest, ListProtocolsPendingApprovalRequest, CountProtocolsPendingApprovalRequest, ListProtocolVersionsByProtocolNumberRequest, GetProtocolsInComparisonRequest, RestartFlowRequest, UploadProtocolImageRequest, DownloadProtocolImageRequest, ValidateProtocolHeaderNotRestrictiveRequest, ValidateAssociatedBulksNotRestrictiveRequest } from "./request";
import { ListTilesResponse } from "./response";
import { NetworkManager, PostParameters } from "../networkmanager";
import { PathOperation } from "./path-operation";
import { Observable } from "rxjs";
import { Injectable } from "@angular/core";
import { Constants } from "../../shared/utils";
import { ConfigurationService } from "../../services/configuration.service";
import { StorageService } from "../../services/storage.service"; 

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

}
