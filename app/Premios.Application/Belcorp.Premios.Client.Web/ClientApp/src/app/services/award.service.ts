import { Injectable } from "@angular/core";
import { AwardAgent } from "../agents/award/award-agent";
//import { ProcessCenter, Process, Equipment, Bulk, Protocol, ProtocolHeader, AgitationType, ListProtocolsByPageFilterParameter, PagedParameter, ProtocolPagedList, ProtocolRawMaterial, ProtocolPendingApproval, ProtocolVersion, ProtocolComparison, CustomFile } from "../models/dtos";
//import { ListCentersRequest, ListProcessesRequest, ListEquipmentsByProcessRequest, ListBulksRequest, ListAgitationTypesRequest, InsertProtocolHeaderRequest, UpdateProtocolRequest, ListProtocolsByPageRequest, GetProtocolRequest, GetProtocolWithDetailsRequest, ListRawMaterialsByProtocolRequest, UpdateProtocolHeaderRequest, ValidateProtocolHeaderRequest, GetBulkWithMaterialsRequest, ApproveFlowRequest, RefuseProtocolRequest, UnsubscribeProtocolRequest, ActivateProtocolRequest, ListProtocolsPendingApprovalRequest, CountProtocolsPendingApprovalRequest, ListProtocolVersionsByProtocolNumberRequest, GetProtocolsInComparisonRequest, RestartFlowRequest, UploadProtocolImageRequest, DownloadProtocolImageRequest, ValidateProtocolHeaderNotRestrictiveRequest, ValidateAssociatedBulksNotRestrictiveRequest } from "../agents/protocol/request";
import { Tiles, CampaignUrl, Detail, Votation, Suggestion, UploadFileResult, CustomFile } from "../models/dtos";
//import {  } from "../agents/protocol/request";
import { Observable } from "rxjs";
import { map } from 'rxjs/operators';
import { ListDetailRequest, InsertVotationRequest, UpdateVotationRequest, ListSuggestionsRequest, UploadCampaignRequest, UploadTeamRequest, UploadImageRequest } from "../agents/award/request";



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

  ListDetailByTeam(teamId: number, codeUser: string): Observable<Detail[]> {

    let listDetailRequest: ListDetailRequest = new ListDetailRequest();
    listDetailRequest.TeamId = teamId;
    listDetailRequest.CodeUser = codeUser;

    return this.awardsAgent.ListDetailByTeam(listDetailRequest)
      .pipe(map((listDetailResponse) => listDetailResponse.Detail));
  }

  InsertVotation(teamId: number, userCode: string, value: number): Observable<Votation>
  {
    let insertVotationRequest: InsertVotationRequest = new InsertVotationRequest();
    insertVotationRequest.TeamId = teamId;
    insertVotationRequest.UserCode = userCode;
    insertVotationRequest.Value = value;

    return this.awardsAgent.InsertVotation(insertVotationRequest)
      .pipe(map((insertVotationResponse) => insertVotationResponse.Votation));

  }

  UpdateVotation(teamId: number, userCode: string, value: number, votationId: number): Observable<Votation> {
    let updateVotationRequest: UpdateVotationRequest = new UpdateVotationRequest();
    updateVotationRequest.TeamId = teamId;
    updateVotationRequest.UserCode = userCode;
    updateVotationRequest.Value = value;
    updateVotationRequest.VotationId = votationId;

    return this.awardsAgent.UpdateVotation(updateVotationRequest)
      .pipe(map((updateVotationResponse) => updateVotationResponse.Votation));

  }

  ListSuggestions(userCode: string): Observable<Suggestion[]> {
    let listSuggestionsRequest: ListSuggestionsRequest = new ListSuggestionsRequest();
    listSuggestionsRequest.CodeUser = userCode;

    return this.awardsAgent.ListSuggestions(listSuggestionsRequest)
      .pipe(map((listSuggestionsRequest) => listSuggestionsRequest.Suggestions));

  }

  UploadCampaign(file: File): Observable<UploadFileResult> {

    let uploadFileRequest: UploadCampaignRequest = new UploadCampaignRequest();
    uploadFileRequest.File = file;
    uploadFileRequest.removePrevious = "false"; 

    return this.awardsAgent.UploadCampaign(uploadFileRequest)
      .pipe(map((uploadCampaignResponse) => uploadCampaignResponse.UploadFilesResult));
  }

  UploadTeam(file: File): Observable<UploadFileResult[]> {

    let uploadFileRequest: UploadTeamRequest = new UploadTeamRequest();
    uploadFileRequest.File = file;

    return this.awardsAgent.UploadTeam(uploadFileRequest)
      .pipe(map((uploadTeamResponse) => uploadTeamResponse.UploadFilesResult));
  }

  UploadImage(file: File): Observable<UploadFileResult[]> {

    let uploadImageRequest: UploadImageRequest = new UploadImageRequest();
    uploadImageRequest.File = file;

    return this.awardsAgent.UploadImage(uploadImageRequest)
      .pipe(map((uploadTeamResponse) => uploadTeamResponse.UploadFilesResult));
  }

  GetRankingReport(): Observable<CustomFile> {

    return this.awardsAgent.GetRankingReport()
      .pipe(map((result) => result.ExcelFile));

  }

}
