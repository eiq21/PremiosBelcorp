import { BaseResponse } from "../../core/base-response";
import { Votation, UploadFileResult } from "../../../models/dtos";
//import { Tiles } from "../../../model/dtos/Tiles";

export class UpdloadTeamResponse extends BaseResponse {
  public UploadFilesResult: UploadFileResult[];
  constructor() {
    super();
    //this.Votation = new Array<Votation>();
    this.UploadFilesResult = new Array<UploadFileResult>();
  }
}
