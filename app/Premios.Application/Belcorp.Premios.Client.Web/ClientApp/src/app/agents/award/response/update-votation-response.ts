import { BaseResponse } from "../../core/base-response";
import { Votation } from "../../../models/dtos";
//import { Tiles } from "../../../model/dtos/Tiles";

export class UpdateVotationResponse extends BaseResponse {
  public Votation: Votation;
  constructor() {
    super();
    //this.Votation = new Array<Votation>();
  }
}
