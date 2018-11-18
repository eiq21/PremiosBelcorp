import { Component, OnInit, HostListener } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Router } from '@angular/router';
import { AwardService, AuthUserService } from '../../../../services';
import { AwardAdapter } from '../../../../models/adapters/award-adapter';
import { BannerViewModel, TileViewModel } from '../../viewmodels';
import { Overlay } from '@angular/cdk/overlay';
import { MatDialog } from '@angular/material';
import { MessageboxDialogComponent } from '../../../core/components/messagebox/messagebox-dialog.component';

@Component({
  selector: 'prem-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

  private _route: ActivatedRoute;
  public listTiles: TileViewModel[];
  public numTiles: number;
  public loading = false;


  constructor(
    private messagebox: MatDialog,
    private overlay: Overlay,
    private route: ActivatedRoute,
    private router: Router,
    private awardService: AwardService,
    private awardAdapter: AwardAdapter
  ) {
  }

  ngOnInit() {
    this.listTilesForActiveCampaign();    
  }


  containerMenu(event: Event) {

    let main = document.querySelector('.pb_main');

    if (this.isShowingSidebar() && main.contains(event.srcElement)) {
      event.preventDefault();
      this.hideSidebar();
    }
  }


  hideSidebar() {
    this.getContainer().classList.remove('show-sidebar');
  }

  isShowingSidebar() {
    return this.getContainer().classList.contains('show-sidebar');
  }

  getContainer(): HTMLElement {
    let container: HTMLElement = null;
    container = document.querySelector('.pb_container'); 

    return container;
  }


  listTilesForActiveCampaign() {  
    let _self = this;
    this.loading = true;
    this.awardService.ListTiles().subscribe(tiles => {
      this.listTiles = this.awardAdapter.TilesToTilesViewModel(tiles);

      this.numTiles = this.listTiles.length;
      this.loading = false;

    }, error => this.ErrorHandler(error, _self));

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


  ErrorHandler(error, _self) {
    _self.openMessagebox('Premios Belcorp', error.StateResponse.MensajeError, '3');
  }

}
