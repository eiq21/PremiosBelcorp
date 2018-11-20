import { BaseResponse } from "../../core/base-response";
import { ChangePassword } from "../../../models/dtos";

export class ChangePasswordResponse extends BaseResponse {
  public ChangePassword: ChangePassword[];

  constructor() {
    super();

    this.ChangePassword = new Array<ChangePassword>();
  } 
}
