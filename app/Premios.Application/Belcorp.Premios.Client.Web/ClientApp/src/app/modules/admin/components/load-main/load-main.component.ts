import { Component, OnInit } from '@angular/core';
import { AwardAdapter } from '../../../../models/adapters/award-adapter';
import { AwardService, AuthUserService } from '../../../../services';
import { MatSnackBar } from '@angular/material';

@Component({
  selector: 'load-main',
  templateUrl: './load-main.component.html',
  styleUrls: ['./load-main.component.scss']
})
export class LoadMainComponent implements OnInit {

  panelOpenState = false;
  public isLoading = false;
  private authUserService: AuthUserService;
  private awardService: AwardService;
  private awardAdapter: AwardAdapter;
  selectedFile: File;

  constructor(
    awardService: AwardService,
    awardAdapter: AwardAdapter,
    authUserService: AuthUserService,
    public snackbar: MatSnackBar,
  ) {
    this.awardAdapter = awardAdapter;
    this.awardService = awardService;
    this.authUserService = authUserService;
  }

  ngOnInit() {
  }

  onFileChanged(event, source) {
    this.selectedFile = event.target.files[0];

    if (source == 'c') { this.UploadCampaign() }
    if (source == 'e') { this.UploadTeam() }

  }

  UploadCampaign() {
    let _self = this;
    this.isLoading = true;
    this.awardService.UploadCampaign(this.selectedFile).subscribe(result => {

      if (result) {
        this.snackbar.open("La campaña se cargó correctamente", 'Close', {
          duration: 3000
        });
      }
      this.isLoading = false;

    }, error => this.ErrorHandler(error, _self));

    
  }

  UploadTeam() {
    let _self = this;
    this.isLoading = true;
    this.awardService.UploadTeam(this.selectedFile).subscribe(result => {

      if (result) {
        this.snackbar.open("Los equipos y su información se cargaron correctamente", 'Close', {
          duration: 3000
        }); 
      }


      this.isLoading = false;
    }, error => this.ErrorHandler(error, _self));
  }

  ErrorHandler(error, _self) {
    //_self.openMessagebox('Premios Belcorp', error.StateResponse.MensajeError, '3');
  }



}
