import { BaseResponse } from "../../core/base-response";
import { Tiles } from "../../../models/dtos";
//import { Tiles } from "../../../model/dtos/Tiles";

export class ListTilesResponse extends BaseResponse {
  public Tiles: Tiles[];
  constructor() {
    super();
    this.Tiles = new Array<Tiles>();
  }
}
