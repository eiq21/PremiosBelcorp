import { Component, OnInit, Input, OnDestroy } from '@angular/core';
import Player from '@vimeo/player';
import { DetailViewModel, VotationViewModel, SuggestionsViewModel } from '../../../viewmodels';
import { NgxSpinnerService } from 'ngx-spinner';
import * as basicLightbox from 'basiclightbox'
import { AwardService, AuthUserService } from '../../../../../services';
import { AwardAdapter } from '../../../../../models/adapters/award-adapter';
import { ActivatedRoute, Router, NavigationEnd } from '@angular/router';

@Component({
  selector: 'detail-vote',
  templateUrl: './detail-vote.component.html',
  styleUrls: ['./detail-vote.component.scss']
})
export class DetailVoteComponent implements OnInit, OnDestroy {
   
  @Input() objDetail: DetailViewModel;
  @Input() listDetail: DetailViewModel[];
  @Input() listSuggestion: SuggestionsViewModel[];
  

  private listVotation: VotationViewModel[];
  private spinner: NgxSpinnerService;
  private awardService: AwardService;
  private awardAdapter: AwardAdapter;
  private authUserService: AuthUserService;
  private modalPublic: any;
  navigationSubscription: any;
  public interval: any;
  public TeamId: any;
  public player: any;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    spinner: NgxSpinnerService,
    awardService: AwardService,
    awardAdapter: AwardAdapter,
    authUserService: AuthUserService
  ) {
    this.spinner = spinner;
    this.awardAdapter = awardAdapter;
    this.awardService = awardService;
    this.authUserService = authUserService;

    this.route.params.subscribe(params => this.TeamId = params['id']);

    this.navigationSubscription = this.router.events.subscribe((e: any) => {
      if (e instanceof NavigationEnd) {
        clearInterval(this.interval);
        this.initializeViewVideo();
      }
    });


  }

  ngOnInit() {
    if (this.modalPublic) { this.modalPublic.close(); }
  }

  initializeViewVideo() {

    

    setTimeout(() => {
      this.spinner.show();

      this.videoDetalle();

    }, 3000);

   
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
      vimeoWrapper = d.querySelector('.Vimeo-wrapper'),
      t = d.getElementById('videoTitle')

    //if (this.modalPublic) {
    //  this.modalPublic.close();
    //}

    let modal;

    if (!this.modalPublic) {

      modal = basicLightbox
        .create(document.querySelector('#template'), {
          closable: true,
          onShow: (instance) => { this.modalPublic = instance; },
          onClose: (instance) => { }
        }
      )
    } else {
      modal = this.modalPublic;
    }

    let vimeoTagID, vimeoID, action

    vimeoTagID = vimeoWrapper.getAttribute('id');
    //vimeoID = vimeoWrapper.getAttribute('data-vimeo-id')

    if (this.player) {
      this.player.destroy();
    }

      this.player = new Player(vimeoTagID, {
        id: this.objDetail.ValueUrl,
        muted: false,
        autoplay: true
    })

    this.player.play();

      this.player.on('ended', function (data) {
        modal.show() 
    })

    this.spinner.hide();

  }

  calificarVideo(event, calificate, teamId, votationId) 
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
        this.printStars(vote);

        this.spinner.hide(); 

      }, error => this.ErrorHandler(error, _self));

    } else
    {
      this.awardService.UpdateVotation(teamID, userLogged, vote, votationId).subscribe(votation => { 

        this.listVotation = this.awardAdapter.VotationToVotationViewModel(votation);
        this.printStars(vote);

        this.spinner.hide(); 

      }, error => this.ErrorHandler(error, _self));
    }   
 
  }

  isPrint(star, vote) {  

    if (parseInt(vote) >= parseInt(star)) {
      return true;
    } else
    {
      return false; 
    }

  }

  printStars(vote) {

    var iStars = Array.from(document.getElementById("RateVote").children);

    var star1 = iStars[0] as HTMLElement;
    var star2 = iStars[1] as HTMLElement;
    var star3 = iStars[2] as HTMLElement;
    var star4 = iStars[3] as HTMLElement;
    var star5 = iStars[4] as HTMLElement;

    this.isPrint(1, vote) ? star1.setAttribute("class", "RateStarVote fa fa-star") : star1.setAttribute("class", "RateStarNoVote fa fa-star");
    this.isPrint(2, vote) ? star2.setAttribute("class", "RateStarVote fa fa-star") : star2.setAttribute("class", "RateStarNoVote fa fa-star");
    this.isPrint(3, vote) ? star3.setAttribute("class", "RateStarVote fa fa-star") : star3.setAttribute("class", "RateStarNoVote fa fa-star");
    this.isPrint(4, vote) ? star4.setAttribute("class", "RateStarVote fa fa-star") : star4.setAttribute("class", "RateStarNoVote fa fa-star");
    this.isPrint(5, vote) ? star5.setAttribute("class", "RateStarVote fa fa-star") : star5.setAttribute("class", "RateStarNoVote fa fa-star");


  }

  ngOnDestroy() {

    clearInterval(this.interval); 
    //debugger;

    if (this.navigationSubscription) { 
      this.navigationSubscription.unsubscribe();
    }
  }

  ErrorHandler(error, _self) {
    //_self.openMessagebox('Premios Belcorp', error.StateResponse.MensajeError, '3');
  }

  

}
