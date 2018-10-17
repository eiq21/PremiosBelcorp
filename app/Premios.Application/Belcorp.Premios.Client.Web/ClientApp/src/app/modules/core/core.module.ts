import { NgModule, Optional, SkipSelf } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { AppComponent } from './containers/app';
import { ViewportComponent } from './components/viewport';
//import { MaterialModule } from '../../shared/material';
//import { ViewportComponent } from './components/viewport';
import { LayoutComponent } from './components/layout/layout.component';
import { AuthenticationService, AuthUserService, StorageService, ConfigurationService } from '../../services/index';
//import { MessageAgent } from '../../agents/message/message-agent';
//import { ReportAgent } from '../../agents/report/report-agent';
//import { NavtoolbarComponent } from './components/navtoolbar/navtoolbar.component';

export const COMPONENTS = [
  AppComponent,
  ViewportComponent,
  LayoutComponent,
 // NavtoolbarComponent
];

@NgModule({
  //imports: [CommonModule, RouterModule, MaterialModule],
  imports: [CommonModule, RouterModule],
  declarations: COMPONENTS,
  exports: COMPONENTS,
  providers: [
    AuthenticationService,
    AuthUserService,
    //SecurityGuardService,
    //AdminGuardService,
    StorageService,
    ConfigurationService,
    //MessageService,
    //MessageAgent,
    //ReportService,
    //ReportAgent
  ]
})
export class CoreModule {
  constructor( @Optional() @SkipSelf() parentModule: CoreModule) {
    if (parentModule) {
      throw new Error('CoreModule is already loaded. Import it in the AppModule only');
    }
  }

  static forRoot() {
    return {
      ngModule: CoreModule
    };
  }
}
