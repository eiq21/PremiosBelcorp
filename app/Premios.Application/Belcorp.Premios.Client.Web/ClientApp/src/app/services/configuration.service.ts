import { Injectable } from '@angular/core';
import { IConfiguration } from '../models/models/configuration.model';
import { StorageService } from './storage.service';
import { Observable, Observer, Subject } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { Constants } from '../shared/utils';


@Injectable()
export class ConfigurationService {
  serverSettings: IConfiguration;
  // observable that is fired when settings are loaded from server
  private settingsLoadedSource = new Subject();
  settingsLoaded$ = this.settingsLoadedSource.asObservable();
  isReady: boolean = false;

  constructor(private http: HttpClient,
    private storageService: StorageService
  ) { }

  loadConfig() {
    var base = document.getElementsByTagName('base')[0].href; 
    const baseURI = base.endsWith('/') ? base : `${base}/`;
    let url = `${baseURI}Configuration/GetConfiguration`;

    this.loadDevelopment();


    this.isReady = true;
    this.settingsLoadedSource.next();
    //this.http.get(url).subscribe((result: any) => {
    //  this.serverSettings = result;
    //  this.storageService.store(Constants.SistemaUrl.IDENTITY_URL, this.serverSettings.identityUrl);
    //  this.storageService.store(Constants.SistemaUrl.AWARD_URL, this.serverSettings.awardUrl);
    //  //this.storageService.store(Constants.SistemaUrl.SECURITY_URL, this.serverSettings.securityUrl);
    //  this.storageService.store(Constants.IdentityServerResource.RESOURCE_OWNER_CLIENT_SECRET, this.serverSettings.resourceOwnerClientSecret);
    //  this.isReady = true;
    //  this.settingsLoadedSource.next();
    //});
  }

  loadDevelopment() {

    if (this.identityUrl == null) {
      this.storageService.store(Constants.SistemaUrl.IDENTITY_URL, 'http://localhost:25612/');
    }

    if (this.awardUrl == null) {
      this.storageService.store(Constants.SistemaUrl.AWARD_URL, 'http://localhost:7945/api/');
    }

    //if (this.securityUrl == null) {
    //  this.storageService.store(Constants.SistemaUrl.SECURITY_URL, 'http://localhost:61884/api/');
    //}

    if (this.resourceOwnerClientSecret == null) {
      this.storageService.store(Constants.IdentityServerResource.RESOURCE_OWNER_CLIENT_SECRET, 'B3lCorPpr0tocolsEv3nts');
    }
  }

  get identityUrl() {
    return this.storageService.retrieve(Constants.SistemaUrl.IDENTITY_URL);
  }

  get awardUrl() {
    return this.storageService.retrieve(Constants.SistemaUrl.AWARD_URL);
  }

  //get securityUrl() {
  //  return this.storageService.retrieve(Constants.SistemaUrl.SECURITY_URL);
  //}
  
  get resourceOwnerClientSecret() {
    return this.storageService.retrieve(Constants.IdentityServerResource.RESOURCE_OWNER_CLIENT_SECRET);
  }
}
