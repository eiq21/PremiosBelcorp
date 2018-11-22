import { BaseResponse } from "../../core/base-response";
import { Suggestion } from "../../../models/dtos";
//import { Tiles } from "../../../model/dtos/Tiles";

export class ListSuggestionsResponse extends BaseResponse {
  public Suggestions: Suggestion[];
  constructor() {
    super();
    this.Suggestions = new Array<Suggestion>(); 
  }
}
