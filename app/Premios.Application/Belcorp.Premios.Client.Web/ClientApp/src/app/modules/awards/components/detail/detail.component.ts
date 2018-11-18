import { Component, OnInit, OnDestroy } from '@angular/core';
import { ActivatedRoute, NavigationEnd, Router } from '@angular/router';
import { AwardService, AuthUserService } from '../../../../services';
import { AwardAdapter } from '../../../../models/adapters/award-adapter';
import { DetailViewModel } from '../../viewmodels';
import { SuggestionsViewModel } from '../../viewmodels/suggestions-view-model';
import { Overlay } from '@angular/cdk/overlay';
import { MatDialog } from '@angular/material';
import { MessageboxDialogComponent } from '../../../core/components/messagebox/messagebox-dialog.component';

@Component({
  selector: 'app-detail',
  templateUrl: './detail.component.html',
  styleUrls: ['./detail.component.scss']
})
export class DetailComponent implements OnInit, OnDestroy {
   

  private _route: ActivatedRoute; 
  public TeamId: number;
  public listDetail: DetailViewModel[];
  public objDetail: DetailViewModel;
  public listSuggestion: SuggestionsViewModel[];
    navigationSubscription: any;
  public interval: any;
  public loading = false;

  constructor(
    private messagebox: MatDialog,
    private overlay: Overlay,
    private route: ActivatedRoute,
    private router: Router,
    private awardService: AwardService,
    private awardAdapter: AwardAdapter,
    private authUserService: AuthUserService
  ) {

    this._route = route;

    this.route.params.subscribe(params => this.TeamId = params['id']);

    this.navigationSubscription = this.router.events.subscribe((e: any) => {
      if (e instanceof NavigationEnd) {
        clearInterval(this.interval);
        this.initializeDetail();
      }
    });

  }

  ngOnInit() {
  }
  
  initializeDetail() { 
    this.listDetailByTeam();
    this.listSuggestions();
  }

  listDetailByTeam() { 
    let _self = this;
    this.loading = true;
    let userLogged = this.authUserService.getLoggedInUser().Username;

    this.awardService.ListDetailByTeam(this.TeamId, userLogged).subscribe(detail => {
      this.listDetail = this.awardAdapter.DetailToDetailViewModel(detail);

      this.objDetail = this.listDetail[0];

      console.log(this.objDetail);

      this.loading = false;
    }, error => this.ErrorHandler(error, _self));
  }

  listSuggestions() {
    let _self = this;
    this.loading = true;
    let userLogged = this.authUserService.getLoggedInUser().Username;

    this.awardService.ListSuggestions(userLogged).subscribe(Suggestions => {
      this.listSuggestion = this.awardAdapter.SuggestionsToSuggestionsViewModel(Suggestions);

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

  ngOnDestroy() {
    clearInterval(this.interval);
    if (this.navigationSubscription) {
      this.navigationSubscription.unsubscribe();
    }
  }

}
