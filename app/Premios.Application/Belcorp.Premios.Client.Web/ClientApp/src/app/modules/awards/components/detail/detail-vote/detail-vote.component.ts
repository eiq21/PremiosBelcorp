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

    this.videoDetalle();

    this.spinner.hide();
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

      player[index].getVideoTitle().then(function (title) {
        t.innerText = title
        console.log('title:', title)
      })

    })

  //const d = document,
  //  vimeoWrapper = Array.from(d.querySelectorAll('.Vimeo-wrapper')),
  //  t = d.getElementById('videoTitle'),
  //  vimeoTagID = d.getElementById('videoDetalle')
  //  let video = null;


  //if (vimeoTagID) {
  //   // Construir el player con el id proporcionado en el html
  //   video = new Player(vimeoTagID, { id: vimeoTagID.getAttribute('data-vimeo-id') }),
       
  //   video.getVideoTitle().then(function (title) {
  //     t.innerText = title
  //     console.log('title:', title)
  //   })

  // }
  }

  ErrorHandler(error, _self) {
    //_self.openMessagebox('Premios Belcorp', error.StateResponse.MensajeError, '3');
  } 

}
