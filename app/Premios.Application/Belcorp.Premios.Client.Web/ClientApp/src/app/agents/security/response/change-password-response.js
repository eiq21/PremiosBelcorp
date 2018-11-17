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
var ChangePasswordResponse = /** @class */ (function (_super) {
    __extends(ChangePasswordResponse, _super);
    function ChangePasswordResponse() {
        var _this = _super.call(this) || this;
        _this.ChangePassword = new Array();
        return _this;
    }
    return ChangePasswordResponse;
}(base_response_1.BaseResponse));
exports.ChangePasswordResponse = ChangePasswordResponse;
//# sourceMappingURL=change-password-response.js.map