import { Injectable } from "@angular/core";
import { AwardAgent } from "../agents/award/award-agent";
//import { ProcessCenter, Process, Equipment, Bulk, Protocol, ProtocolHeader, AgitationType, ListProtocolsByPageFilterParameter, PagedParameter, ProtocolPagedList, ProtocolRawMaterial, ProtocolPendingApproval, ProtocolVersion, ProtocolComparison, CustomFile } from "../models/dtos";
//import { ListCentersRequest, ListProcessesRequest, ListEquipmentsByProcessRequest, ListBulksRequest, ListAgitationTypesRequest, InsertProtocolHeaderRequest, UpdateProtocolRequest, ListProtocolsByPageRequest, GetProtocolRequest, GetProtocolWithDetailsRequest, ListRawMaterialsByProtocolRequest, UpdateProtocolHeaderRequest, ValidateProtocolHeaderRequest, GetBulkWithMaterialsRequest, ApproveFlowRequest, RefuseProtocolRequest, UnsubscribeProtocolRequest, ActivateProtocolRequest, ListProtocolsPendingApprovalRequest, CountProtocolsPendingApprovalRequest, ListProtocolVersionsByProtocolNumberRequest, GetProtocolsInComparisonRequest, RestartFlowRequest, UploadProtocolImageRequest, DownloadProtocolImageRequest, ValidateProtocolHeaderNotRestrictiveRequest, ValidateAssociatedBulksNotRestrictiveRequest } from "../agents/protocol/request";
import { Tiles, CampaignUrl, Detail } from "../models/dtos";
//import {  } from "../agents/protocol/request";
import { Observable } from "rxjs";
import { map } from 'rxjs/operators';
import { ListDetailRequest } from "../agents/award/request";


@Injectable()
export class AwardService {

  private awardsAgent: AwardAgent;

  constructor(awardsAgent: AwardAgent) {
    this.awardsAgent = awardsAgent;
  }

  ListTiles(): Observable<Tiles[]> {
    return this.awardsAgent.ListTiles() 
      .pipe(map((listTilesResponse) => listTilesResponse.Tiles));
  }

  ListBannersByActiveCampaign(): Observable<CampaignUrl[]> {
    return this.awardsAgent.ListBannersByActiveCampaign()
      .pipe(map((listBannersResponse) => listBannersResponse.CampaignUrl));
  }

  ListDetailByTeam(teamId: number): Observable<Detail[]> {

    let listDetailRequest: ListDetailRequest = new ListDetailRequest();
    listDetailRequest.TeamId = teamId;

    return this.awardsAgent.ListDetailByTeam(listDetailRequest)
      .pipe(map((listDetailResponse) => listDetailResponse.Detail));
  }
  
}
