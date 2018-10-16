import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { SecurityService } from './security.service';
import { StorageService } from './storage.service';
import { AuthUserService } from './auth-user.service';
//import { UserModel } from '../models/models/user.model';
import { Router } from '@angular/router';
import { Constants } from '../shared/utils';

@Injectable()
export class AuthenticationService {

  private redirectUrl: string = '/';

  constructor(
    private router: Router,
    private securityService: SecurityService,
    private storageService: StorageService,
    private authUserService: AuthUserService
  ) {
  }

  login(username: string, password: string): Observable<string> {

    return new Observable<string>(observer => {
      this.securityService.ConnectToken(username, password).subscribe(token => {
        if (token) {
          this.authUserService.setUserToken(token);
          //this.securityService.ListUserGrantedAccessesByUsername(username).subscribe(userGrantedAccess => {
          //  let loggedInUser = new UserModel();
          //  loggedInUser.Username = username;
          //  loggedInUser.GrantedAccesses = userGrantedAccess.GrantedAccesses;
          //  userGrantedAccess.UserProcesses.forEach(userProcess => { loggedInUser.Processes.push(userProcess.Process) });
          //  loggedInUser.isSuperAdmin = loggedInUser.GrantedAccesses.find(q => q.Code == Constants.PermisoSistema.PERMISO_ADMINISTRADOR_SISTEMA) != null;

          //  this.authUserService.setLoggedInUser(loggedInUser);
          //  observer.next("");
          //});

        } else {
          observer.next(Constants.MensajeSistema.USUARIO_PASSWORD_INCORRECTOS);
        }
      }, error => {
        observer.next(error);
      });
    });
  }

  getRedirectUrl(): string {
    return this.redirectUrl;
  }

  setRedirectUrl(url: string): void {
    this.redirectUrl = url;
  }

  logout(): void {
    this.authUserService.LogOutUser();
    this.router.navigate([Constants.Routes.LOGIN]);
  }
}
