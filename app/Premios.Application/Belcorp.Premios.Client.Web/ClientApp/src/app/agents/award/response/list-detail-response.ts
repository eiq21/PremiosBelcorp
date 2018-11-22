import { BaseResponse } from "../../core/base-response";
import { CampaignUrl, Detail } from "../../../models/dtos";
//import { Tiles } from "../../../model/dtos/Tiles";

export class ListDetailResponse extends BaseResponse {
  public Detail: Detail[];
  constructor() {
    super();
    this.Detail = new Array<Detail>();
  }
}
