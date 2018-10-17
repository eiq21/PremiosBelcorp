import { Injectable } from "@angular/core";
//import { User, SystemProfile, ListUsersByPageFilterParameter, PagedParameter, UserPagedList, UserLdap, GrantedAccess, UserGrantedAccess, ListSystemProfilesByPageFilterParameter, ProfilesPagedList } from "../models/dtos";
//import { ValidateUserRequest, ListUsersByPageRequest, ListSystemProfileRequest, ListUsersLDAPRequest, ListGrantedAccessesByUsernameRequest, InsertUserRequest, GetUserByUsernameRequest, GetUserByIdRequest, DeleteUserRequest, UpdateUserRequest, ListUsersBySystemProfileRequest, ListUserGrantedAccessesByUsernameRequest, ConnectTokenRequest, DeleteSystemProfileRequest, ListSystemProfilesByPageRequest, ListGrantedAccessesRequest, InserSystemProfileRequest, UpdateSystemProfileRequest, GetSystemProfileByPerfilIdRequest } from "../agents/security/request";
import { ConnectTokenRequest } from "../agents/security/request";
import { Observable } from "rxjs";
import { map } from 'rxjs/operators';
import { SecurityAgent } from "../agents/security/security-agent";

@Injectable()
export class SecurityService {
  private securityAgent: SecurityAgent;

  constructor(securityAgent: SecurityAgent) {
    this.securityAgent = securityAgent;
  }

  ConnectToken(username: string, password: string): Observable<string>
  {
    let connectTokenRequest: ConnectTokenRequest = new ConnectTokenRequest();
    connectTokenRequest.username = username;
    connectTokenRequest.password = password;

    return this.securityAgent.ConnectToken(connectTokenRequest)
      .pipe(map((validateResponse) => validateResponse.access_token));
  }

}
