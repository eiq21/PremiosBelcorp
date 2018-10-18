import { BaseResponse } from "../../core/base-response";
import { CampaignUrl } from "../../../models/dtos";
//import { Tiles } from "../../../model/dtos/Tiles";

export class ListBannersResponse extends BaseResponse {
  public CampaignUrl: CampaignUrl[];
  constructor() {
    super();
    this.CampaignUrl = new Array<CampaignUrl>();
  }
}
