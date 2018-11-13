import { Component, OnInit } from '@angular/core';
import { AwardAdapter } from '../../../../models/adapters/award-adapter';
import { AwardService, AuthUserService } from '../../../../services';
import { MatSnackBar } from '@angular/material';
import { UploadFileResult } from '../../../../models/dtos';

@Component({
  selector: 'load-main',
  templateUrl: './load-main.component.html',
  styleUrls: ['./load-main.component.scss']
})
export class LoadMainComponent implements OnInit {

  panelOpenState = false;
  public loading = false;
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

  onFileChanged(event) {
    this.selectedFile = event.target.files[0];
  }

  UploadCampaign() {
    let _self = this;
    this.loading = true; 
    this.awardService.UploadCampaign(this.selectedFile).subscribe(UploadFilesResult => {

      //var result = UploadFilesResult as UploadFileResult[];

      if (UploadFilesResult[0].Status) { 
        this.snackbar.open("La campaña se cargó correctamente", 'Close', {
          duration: 3000
        });
      } else {
        this.snackbar.open("Ocurrió un error al subir el archivo", 'Close', {
          duration: 3000
        });
      }
      this.loading = false;

    }, error => this.ErrorHandler(error, _self)); 

    
  }

  UploadTeam() {
    let _self = this; 
    this.loading = true;
    this.awardService.UploadTeam(this.selectedFile).subscribe(UploadFilesResult => {

      if (UploadFilesResult[0].Status) {
        this.snackbar.open("Los equipos y su información se cargaron correctamente", 'Close', {
          duration: 3000
        });
      } else {
          this.snackbar.open("Ocurrió un error al subir el archivo", 'Close', {
            duration: 3000
          });
      }

      this.loading = false;
    }, error => this.ErrorHandler(error, _self));
  }

  ErrorHandler(error, _self) {
    //_self.openMessagebox('Premios Belcorp', error.StateResponse.MensajeError, '3');
  }



}
