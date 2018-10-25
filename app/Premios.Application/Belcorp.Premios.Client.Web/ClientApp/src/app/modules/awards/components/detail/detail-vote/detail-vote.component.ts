import { Component, OnInit, Input } from '@angular/core';
import Player from '@vimeo/player';
import { DetailViewModel, VotationViewModel } from '../../../viewmodels';
import { NgxSpinnerService } from 'ngx-spinner';
import * as basicLightbox from 'basiclightbox'
import { AwardService, AuthUserService } from '../../../../../services';
import { AwardAdapter } from '../../../../../models/adapters/award-adapter';

@Component({
  selector: 'detail-vote',
  templateUrl: './detail-vote.component.html',
  styleUrls: ['./detail-vote.component.scss']
})
export class DetailVoteComponent implements OnInit {

  @Input() objDetail: DetailViewModel;
  @Input() listDetail: DetailViewModel[];
  private listVotation: VotationViewModel[];
  private spinner: NgxSpinnerService;
  private awardService: AwardService;
  private awardAdapter: AwardAdapter;
  private authUserService: AuthUserService;
  private modalPublic: any;

  constructor(
    spinner: NgxSpinnerService,
    awardService: AwardService,
    awardAdapter: AwardAdapter,
    authUserService: AuthUserService
  ) {
    this.spinner = spinner;
    this.awardAdapter = awardAdapter;
    this.awardService = awardService;
    this.authUserService = authUserService;
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

      const modal = basicLightbox
      .create(document.querySelector('#template'), { 
        closable: true,
        onShow: (instance) => { this.modalPublic = instance; }
          //onClose: (instance) => {
          //  //const rateStars = d.querySelector('.RateVote') as HTMLElement;
          //
          //  //var ss = 
          //
          //  //glow = d.getElementById('glow')
          //  //rateStars.style.display = 'block'
          //  //glow.classList.toggle('EffectAfterVote')
          //}
        }
      )

    let vimeoTagID, vimeoID, player = {}, action

    vimeoWrapper.map((elem, index) => {

      vimeoTagID = elem.getAttribute('id')
      vimeoID = elem.getAttribute('data-vimeo-id')

      player[index] = new Player(vimeoTagID, {
        id: this.objDetail.ValueUrl,
        muted: false,
        autoplay: true
      })

      player[index].on('ended', function (data) {
        modal.show() 
      })

    })

    console.log(modal);

  }

  calificarVideo(event, calificate, teamId, actuallyVote, votationId)
  {
    
    let _self = this;    

    let userLogged = this.authUserService.getLoggedInUser().Username;
    let vote = calificate;
    let teamID = teamId;

    this.modalPublic.close(); 

    this.spinner.show();

    if (votationId == null) {

      this.awardService.InsertVotation(teamID, userLogged, vote).subscribe(votation => {
        this.listVotation = this.awardAdapter.VotationToVotationViewModel(votation);

       
        this.spinner.hide(); 
      }, error => this.ErrorHandler(error, _self));

    } else
    {
      this.awardService.UpdateVotation(teamID, userLogged, vote, votationId).subscribe(votation => {
        this.listVotation = this.awardAdapter.VotationToVotationViewModel(votation);

        this.spinner.hide();
      }, error => this.ErrorHandler(error, _self));
    }
    
  }

  

  ErrorHandler(error, _self) {
    //_self.openMessagebox('Premios Belcorp', error.StateResponse.MensajeError, '3');
  } 

}
