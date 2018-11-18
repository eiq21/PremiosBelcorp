import { Component, OnInit, Inject, ViewChild, ElementRef } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA, MatIconRegistry } from '@angular/material';
import { DomSanitizer } from '@angular/platform-browser';
import { Constants } from '../../../../shared/utils';
@Component({
  selector: 'prem-messagebox-dialog',
  templateUrl: './messagebox-dialog.component.html',
  styleUrls: ['./messagebox-dialog.component.scss']
})
export class MessageboxDialogComponent implements OnInit {
  public messageboxDialogRef: MatDialogRef<MessageboxDialogComponent>;

  @ViewChild("container") container: ElementRef; 
  public messageTitle: string;
  public messageBoxTxt: string;
  public messageBoxIcon: string;
  public messageBoxButtons: string;
  public button1: any;
  public button2: any;
  public messageBoxBtnAceptar: boolean;
  public messageBoxBtnCancelar: boolean;
  public dato: string;
  constructor(
    messageboxDialogRef: MatDialogRef<MessageboxDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any,
    iconRegistry: MatIconRegistry,
    sanitizer: DomSanitizer
  ) {
      
    this.messageboxDialogRef = messageboxDialogRef;
    this.messageTitle = data.messageTitle;
    this.messageBoxTxt = data.messageBoxTxt;
    this.messageBoxBtnAceptar = data.messageBoxBtnAceptar;
    this.messageBoxBtnCancelar = data.messageBoxBtnCancelar;
    
    if (data.messageBoxIcon == Constants.TipoMensajeIcono.OK){
      iconRegistry.addSvgIcon('icon', sanitizer.bypassSecurityTrustResourceUrl('./../../../assets/img/icon-ok.svg'));
    }
    if (data.messageBoxIcon == Constants.TipoMensajeIcono.INFORMATION) {
      iconRegistry.addSvgIcon('icon', sanitizer.bypassSecurityTrustResourceUrl('./../../../assets/img/icon-information.svg'));
    }
    if (data.messageBoxIcon == Constants.TipoMensajeIcono.WARNING) {
      iconRegistry.addSvgIcon('icon', sanitizer.bypassSecurityTrustResourceUrl('./../../../assets/img/ico-warning.svg'));
    }
    if (data.messageBoxIcon == Constants.TipoMensajeIcono.ERROR) {
      iconRegistry.addSvgIcon('icon', sanitizer.bypassSecurityTrustResourceUrl('./../../../assets/img/icon.error.svg'));
    }
    this.messageBoxButtons = data.messageBoxButtons;
    this.dato = data.textButton;
  }
  ngOnInit() {
    if (this.messageBoxBtnAceptar == true) {
      if (this.data.buttons && this.data.buttons[0]) {
        this.button1 = this.data.buttons[0];
      }
    } else {
      this.button1 = false;
    }
   
  }
  onCloseCancel() {
    this.messageboxDialogRef.close(null);
  }

  onClickButton(idButton: number) {
    this.messageboxDialogRef.close(idButton);
  }

 
}
