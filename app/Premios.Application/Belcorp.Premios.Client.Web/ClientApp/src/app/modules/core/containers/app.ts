import { Component, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { ConfigurationService } from '../../../services/configuration.service';

import { AuthenticationService } from '../../../services/index';
@Component({
  selector: 'prem-app',
  template: `<prem-viewport></prem-viewport>`,
  styles: []
})
export class AppComponent implements OnInit {

  Authenticated: boolean = false;
  subscription: Subscription;

  constructor(
    private configurationService: ConfigurationService,
    private authenticationService: AuthenticationService
  ) {

  } 

  ngOnInit() {



    this.configurationService.loadConfig();


  }

}
