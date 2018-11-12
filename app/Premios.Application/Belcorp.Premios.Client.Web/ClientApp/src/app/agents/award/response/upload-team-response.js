"use strict";
var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p]; };
        return extendStatics(d, b);
    }
    return function (d, b) {
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
Object.defineProperty(exports, "__esModule", { value: true });
var base_response_1 = require("../../core/base-response");
//import { Tiles } from "../../../model/dtos/Tiles";
var UpdloadTeamResponse = /** @class */ (function (_super) {
    __extends(UpdloadTeamResponse, _super);
    function UpdloadTeamResponse() {
        var _this = _super.call(this) || this;
        //this.Votation = new Array<Votation>();
        _this.UploadFileResult = new Array();
        return _this;
    }
    return UpdloadTeamResponse;
}(base_response_1.BaseResponse));
exports.UpdloadTeamResponse = UpdloadTeamResponse;
//# sourceMappingURL=upload-team-response.js.map