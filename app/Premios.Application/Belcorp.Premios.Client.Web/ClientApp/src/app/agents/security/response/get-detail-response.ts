import { BaseResponse } from "../../core/base-response";
import { UserDetail } from "../../../models/dtos";

export class GetDetailResponse extends BaseResponse {
  public UserDetailProfile: UserDetail;

  constructor() {
    super();
    this.UserDetailProfile = new UserDetail();
  } 
}
