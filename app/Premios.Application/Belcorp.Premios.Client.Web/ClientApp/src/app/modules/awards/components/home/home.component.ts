import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Router } from '@angular/router';
import { NgxSpinnerService } from 'ngx-spinner';
import { AwardService } from '../../../../services';
import { AwardAdapter } from '../../../../models/adapters/award-adapter';
import { BannerViewModel, TileViewModel } from '../../viewmodels';

@Component({
  selector: 'prem-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

  private _route: ActivatedRoute;
  public listTiles: TileViewModel[];
  public Rows: number[] = new Array<number>();

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private awardService: AwardService,
    private awardAdapter: AwardAdapter,
    private spinner: NgxSpinnerService
  ) {



  }

  ngOnInit() {


    this.listTilesForActiveCampaign();

  }

 


  listTilesForActiveCampaign() {
    let _self = this;

    this.awardService.ListTiles().subscribe(tiles => {
      this.listTiles = this.awardAdapter.TilesToTilesViewModel(tiles);

      var prenumRows = (this.listTiles.length) / 6;
      var numRows = Math.ceil(prenumRows);

      if (numRows <= 1) {
        this.Rows.push(1);
      } else {

        for (var _i = 0; _i < numRows; _i++) {
          this.Rows[_i] = _i;
        }

      }

    }, error => this.ErrorHandler(error, _self));

  }


  ErrorHandler(error, _self) {
    //_self.openMessagebox('Premios Belcorp', error.StateResponse.MensajeError, '3');
  }

}
