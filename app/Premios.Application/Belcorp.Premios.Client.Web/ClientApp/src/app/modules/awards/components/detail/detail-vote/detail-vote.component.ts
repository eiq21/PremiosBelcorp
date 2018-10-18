import { Component, OnInit, Input } from '@angular/core';
import Player from '@vimeo/player';
import { ActivatedRoute } from '@angular/router';
import { AwardService, AuthenticationService, SecurityService } from '../../../../../services';
import { AwardAdapter } from '../../../../../models/adapters/award-adapter';
import { DetailViewModel } from '../../../viewmodels';

@Component({
  selector: 'detail-vote',
  templateUrl: './detail-vote.component.html',
  styleUrls: ['./detail-vote.component.scss']
})
export class DetailVoteComponent implements OnInit {

  @Input() objDetail: DetailViewModel[];
  private _route: ActivatedRoute; 
  private awardService: AwardService;
  private awardAdapter: AwardAdapter;
  public TeamId: number;


  constructor(
    route: ActivatedRoute,
    awardService: AwardService,
    awardAdapter: AwardAdapter
  ) {
    this._route = route;
    this.awardService = awardService;
    this.awardAdapter = awardAdapter;
  }

  ngOnInit() {
    this.videoDetalle();
  }

 

  videoDetalle() {

  const d = document,
    vimeoWrapper = Array.from(d.querySelectorAll('.Vimeo-wrapper')),
    t = d.getElementById('videoTitle'),
    vimeoTagID = d.getElementById('videoDetalle')
    let video = null;

  if (vimeoTagID) {
     // Construir el player con el id proporcionado en el html
     video = new Player(vimeoTagID, { id: vimeoTagID.getAttribute('data-vimeo-id') }),
       
     video.getVideoTitle().then(function (title) {
       t.innerText = title
       console.log('title:', title)
     })

   }
}

  ErrorHandler(error, _self) {
    //_self.openMessagebox('Premios Belcorp', error.StateResponse.MensajeError, '3');
  } 

}
