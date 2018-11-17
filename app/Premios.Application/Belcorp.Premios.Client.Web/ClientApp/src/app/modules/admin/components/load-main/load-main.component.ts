import { Component, OnInit } from '@angular/core';
import { MatProgressBarModule, MatSnackBar, TooltipPosition } from '@angular/material';
import { AwardAdapter } from '../../../../models/adapters/award-adapter';
import { AuthUserService, AwardService } from '../../../../services';
import { FormControl } from '@angular/forms';
import { Functions } from '../../../../shared/utils';

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
  selectedImages: File[];

  color = 'primary';
  mode = 'determinate';
  value = 0;
  bufferValue = 100;

  positionOptions: TooltipPosition[] = ['after', 'before', 'above', 'below', 'left', 'right'];
  position = new FormControl(this.positionOptions[3]);

  constructor(
    awardService: AwardService,
    awardAdapter: AwardAdapter,
    authUserService: AuthUserService,
    public snackbar: MatSnackBar,
    public progressbar: MatProgressBarModule
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

  onImagesChanged(event) {
    this.selectedImages = event.target.files;
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

  UploadImages() {

    let _self = this;

    let numImgs = this.selectedImages.length;
    let increase = (numImgs * 0.1) / 100;
    let i: number = 0;
    let errors: string = "";

    this.loading = true; 

    for (let imgFile of this.selectedImages) { 
      this.awardService.UploadImage(imgFile).subscribe(UploadFilesResult => {
        //var result = UploadFilesResult;
        //var inc = increase++;        
        //this.value = inc;
          if (UploadFilesResult[0].Status == true && UploadFilesResult != null) {
            i++;
          } else {
            errors += imgFile.name + ",  ";
          }
                
      }, error => this.ErrorHandler(error, _self));  
    }

    setTimeout(() => {

      this.loading = false;

      console.log("i = " + i);

      if (i == this.selectedImages.length) {
        this.snackbar.open("Se cargaron correctamente todas las imagenes", 'Close', {
          duration: 3000
        });
      }
      else {  
      
        this.snackbar.open("Ocurrió un error al intentar subir algunas imagenes, no deben pesar más de 1.5 MB", 'Close', {
          duration: 10000
        });
      
      }
    }, 5000);
  }

  GetReportRanking() {

    let _self = this;

    this.loading = true;

    this.awardService.GetRankingReport().subscribe(excelFile => {
      Functions.FileFromByteArray(excelFile.FileName, excelFile.ContentType, Functions.base64ToArrayBuffer(excelFile.FileContents));
      this.loading = false;
    }, error => this.ErrorHandler(error, _self));

  }

  ErrorHandler(error, _self) {
    this.snackbar.open(error.StateResponse.MensajeError, 'Close', {
      duration: 10000
    });
    //_self.openMessagebox('Premios Belcorp', error.StateResponse.MensajeError, '3');
  }

 



}
