import { Component, OnInit, OnDestroy } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { AwardService } from '../../../../services';
import { AwardAdapter } from '../../../../models/adapters/award-adapter';
import { DetailViewModel } from '../../viewmodels';
import { NgxSpinnerService } from 'ngx-spinner';


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

  constructor(
    private route: ActivatedRoute, 
    private awardService: AwardService,
    private awardAdapter: AwardAdapter,
    private spinner: NgxSpinnerService
  ) {

    this._route = route;

    this.route.params.subscribe(params => this.TeamId = params['id']);


  }

  ngOnInit() {


    this.spinner.show();
    this.listDetailByTeam();
   
  }

  listDetailByTeam() {
    let _self = this;

    this.awardService.ListDetailByTeam(this.TeamId).subscribe(detail => {
      this.listDetail = this.awardAdapter.DetailToDetailViewModel(detail);

      this.objDetail = this.listDetail[0];

      console.log(this.objDetail);

      this.spinner.hide();
    }, error => this.ErrorHandler(error, _self));
  }

  ngOnDestroy() {

  }


  ErrorHandler(error, _self) {
    //_self.openMessagebox('Premios Belcorp', error.StateResponse.MensajeError, '3');
  }
}
