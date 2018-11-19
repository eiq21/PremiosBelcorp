import { Component, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { ConfigurationService } from '../../../services/configuration.service';

import { AuthenticationService } from '../../../services/index';
import { MessageboxDialogComponent } from '../components/messagebox/messagebox-dialog.component';
import { Constants } from '../../../shared/utils';
import { MatDialog } from '@angular/material';
import { Overlay } from '@angular/cdk/overlay';
@Component({
  selector: 'prem-app',
  template: `<prem-viewport></prem-viewport>`,
  styles: []
})
export class AppComponent implements OnInit {

  Authenticated: boolean = false;
  subscription: Subscription;

  constructor(
    private messagebox: MatDialog,
    private overlay: Overlay,
    private configurationService: ConfigurationService,
    private authenticationService: AuthenticationService
  ) {

  } 

  ngOnInit() {  

    this.configurationService.loadConfig();

  }


}
