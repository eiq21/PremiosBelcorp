import { Component, OnInit, HostListener, OnDestroy, ViewEncapsulation  } from '@angular/core';
import { NavigationEnd } from '@angular/router';
import { ActivatedRoute, Router } from '@angular/router';
import { AwardService } from '../../../../services';
import { AwardAdapter } from '../../../../models/adapters/award-adapter';
import { DetailViewModel } from '../../viewmodels';


@Component({
  selector: 'app-detail',
  templateUrl: './detail.component.html',
  //encapsulation: ViewEncapsulation.None,
  styleUrls: ['./detail.component.scss']
})
export class DetailComponent implements OnInit, OnDestroy {

  public TeamId: number;
  private listDetail: DetailViewModel[];
  public objDetail: DetailViewModel;

  constructor(
    private route: ActivatedRoute, 
    private router: Router,
    private awardService: AwardService,
    private awardAdapter: AwardAdapter
  ) {
    this.route.params.subscribe(params => this.TeamId = params['id']);
  }

  ngOnInit() {
    this.listDetailByTeam();
  }

  listDetailByTeam() {
    let _self = this;

    this.awardService.ListDetailByTeam(this.TeamId).subscribe(detail => {
      this.listDetail = this.awardAdapter.DetailToDetailViewModel(detail);

      this.objDetail = this.listDetail[0];

    }, error => this.ErrorHandler(error, _self));
  }

  ngOnDestroy() {

  }


  ErrorHandler(error, _self) {
    //_self.openMessagebox('Premios Belcorp', error.StateResponse.MensajeError, '3');
  }
}
