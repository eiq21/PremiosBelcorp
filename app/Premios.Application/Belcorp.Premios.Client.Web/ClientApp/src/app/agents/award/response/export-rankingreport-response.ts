import { BaseResponse } from "../../core/base-response";
import { CustomFile } from "../../../models/dtos";

export class ExportRankingReportResponse extends BaseResponse {
  public ExcelFile: CustomFile;

  constructor() {
    super();
  }
}
