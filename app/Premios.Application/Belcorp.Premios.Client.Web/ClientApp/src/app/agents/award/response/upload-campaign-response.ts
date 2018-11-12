import { BaseResponse } from "../../core/base-response";
import { Votation } from "../../../models/dtos";
//import { Tiles } from "../../../model/dtos/Tiles";

export class UpdloadCampaignResponse extends BaseResponse {
  public result: boolean;
  constructor() {
    super();
    //this.Votation = new Array<Votation>();
  }
}
