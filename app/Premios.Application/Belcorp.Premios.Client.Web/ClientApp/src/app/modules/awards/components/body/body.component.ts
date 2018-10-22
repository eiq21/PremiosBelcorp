import { Component, OnInit, ElementRef, OnDestroy, ViewChild } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { TileViewModel } from '../../../../modules/awards/viewmodels/index';
import { AwardService } from '../../../../services';
import { AwardAdapter } from '../../../../models/adapters/award-adapter';


@Component({
  selector: 'prem-premios-index',
  templateUrl: './body.component.html', 
  styleUrls: ['./body.component.scss']
}) 
export class BodyComponent implements OnInit, OnDestroy { 

  private _route: ActivatedRoute;  
  public listTiles: TileViewModel[];
  public Rows: number[] = new Array<number>();
  private awardService: AwardService;
  private awardAdapter: AwardAdapter;

  

  constructor(route: ActivatedRoute,
    awardService: AwardService,
    awardAdapter: AwardAdapter
  ) {
    this._route = route;

    this.awardService = awardService; 
    this.awardAdapter = awardAdapter;

  }

  ngOnInit() {

    this.listTilesForActiveCampaign();
  }


  ngAfterViewInit() { 
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

  ngOnDestroy() {
  }



}
