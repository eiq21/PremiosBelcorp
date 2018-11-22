import { Injectable } from "@angular/core";
import { CanActivate, Router, CanActivateChild, Route, ActivatedRouteSnapshot, RouterStateSnapshot } from "@angular/router";
import { AuthenticationService } from "./authentication.service";
import { AuthUserService } from "./auth-user.service";
import { Constants } from "../shared/utils";
import { Overlay } from "@angular/cdk/overlay";
import { MessageboxDialogComponent } from "../modules/core/components/messagebox/messagebox-dialog.component";
import { MatDialog } from "@angular/material";

@Injectable()
export class SecurityGuardService implements CanActivate, CanActivateChild {

  constructor(
    private messagebox: MatDialog,
    private overlay: Overlay,
    private router: Router,
    private authenticationService: AuthenticationService,
    private authUserService: AuthUserService
  ) {
    //console.log("vaya que si llegó");

  }

  canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean {
    let url: string = state.url; 
  
    if (!this.authUserService.isUserLoggedIn()) {
      this.authenticationService.setRedirectUrl(url);
      this.router.navigate([Constants.Routes.LOGIN]);
      return false;
    }
     
    return true;
  }

  canActivateChild(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean {
    let url: string = state.url;
    
    if (this.checkLoginURL(state.url)) {
      return true;
    }

    if (!this.authUserService.isUserLoggedIn()) {
      this.authenticationService.setRedirectUrl(url);
      this.router.navigate([Constants.Routes.LOGIN]);
      return false;
    }

    return true;
  }

  openMessagebox(title, messageText, imgIcon, btnAceptar = true): void {
    let messageboxRef = this.messagebox.open(MessageboxDialogComponent, {
      scrollStrategy: this.overlay.scrollStrategies.noop(),
      disableClose: true,
      data: {
        messageTitle: title,
        messageBoxTxt: messageText,
        messageBoxIcon: imgIcon,
        messageBoxBtnAceptar: btnAceptar,
        buttons: [
          { textButton: 'Aceptar' }
        ]
      }
    });
  }


  private checkLoginURL(url) {
    return (Constants.Routes.LOGIN == url) ? true : false;
  }
}
