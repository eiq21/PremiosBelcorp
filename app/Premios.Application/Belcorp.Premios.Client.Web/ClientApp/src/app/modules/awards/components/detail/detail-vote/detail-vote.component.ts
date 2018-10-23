import { Component, OnInit, Input } from '@angular/core';
import Player from '@vimeo/player';
import { DetailViewModel } from '../../../viewmodels';
import { NgxSpinnerService } from 'ngx-spinner';


@Component({
  selector: 'detail-vote',
  templateUrl: './detail-vote.component.html',
  styleUrls: ['./detail-vote.component.scss']
})
export class DetailVoteComponent implements OnInit {

  @Input() objDetail: DetailViewModel;
  @Input() listDetail: DetailViewModel[];
  private spinner: NgxSpinnerService;

  constructor(
    spinner: NgxSpinnerService
  ) {
    this.spinner = spinner;
  }

  ngOnInit() {

     

  }

  ngAfterViewInit() {

    this.spinner.show();

    //setTimeout(() => {
        this.videoDetalle();
    //});

    this.spinner.hide();

  }

  activeTab1() {

    let sinopsisTab = <HTMLElement>document.querySelector('.Sinopsis');
    let collaboratorTab = <HTMLElement>document.querySelector('.Collaborator');

    let tabS = <HTMLElement>document.querySelector('.tab1');
    let tabC = <HTMLElement>document.querySelector('.tab2');

    if (sinopsisTab) {
      sinopsisTab.setAttribute("data-tabby-active", "");
      tabS.setAttribute("data-tabby-active", "");
    }

    if (collaboratorTab) {
      collaboratorTab.attributes.removeNamedItem("data-tabby-active");
      tabC.attributes.removeNamedItem("data-tabby-active");
    }

  }

  activeTab2() {

    let tabS = <HTMLElement>document.querySelector('.tab1');
    let tabC = <HTMLElement>document.querySelector('.tab2');

    let sinopsisTab = <HTMLElement>document.querySelector('.Sinopsis');
    let collaboratorTab = <HTMLElement>document.querySelector('.Collaborator');

    if (sinopsisTab) {
      sinopsisTab.attributes.removeNamedItem("data-tabby-active");
      tabS.attributes.removeNamedItem("data-tabby-active");
    }

    if (collaboratorTab) {
      collaboratorTab.setAttribute("data-tabby-active", "");
      tabC.setAttribute("data-tabby-active", "");
    }


  }

 

  videoDetalle() {

    const d = document,
      vimeoWrapper = Array.prototype.slice.call(d.querySelectorAll('.Vimeo-wrapper')),
      t = d.getElementById('videoTitle')

    let vimeoTagID, vimeoID, player = {}, action

    vimeoWrapper.map((elem, index) => {

      vimeoTagID = elem.getAttribute('id')
      vimeoID = elem.getAttribute('data-vimeo-id')

      player[index] = new Player(vimeoTagID, {
        id: this.objDetail.ValueUrl,
        muted: false,
        autoplay: true
      })

    })  

  }

  ErrorHandler(error, _self) {
    //_self.openMessagebox('Premios Belcorp', error.StateResponse.MensajeError, '3');
  } 

}
