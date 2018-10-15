import { Component, OnInit, ElementRef, OnDestroy, ViewChild } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { TileViewModel } from '../../../../modules/awards/viewmodels/index';
import { AwardService } from '../../../../services';
import { AwardAdapter } from '../../../../models/adapters/award-adapter';


@Component({
  selector: 'prem-premios-index',
  template: ` 
    <router-outlet name="premios-index">
    </router-outlet>  
  `,
  templateUrl: './body.component.html', 
  styleUrls: ['./body.component.scss']
}) 
export class BodyComponent implements OnInit, OnDestroy { 

  private _route: ActivatedRoute;  
  public listTiles: TileViewModel[];
  public Rows: number[];
  private awardService: AwardService;
  private awardAdapter: AwardAdapter;

  constructor(route: ActivatedRoute,
    awardService: AwardService,
    awardAdapter: AwardAdapter
  ) {
    this._route = route;

    this.awardService = awardService;
    this.awardAdapter = awardAdapter;

    //this.listTiles = new TileViewModel[];

    this.listTilesForActiveCampaign();
  }

  ngOnInit() {

    //this.PlayerVimeo = new Player();
  }


  ngAfterViewInit() { 
    //this.previewVideo()
  }


  listTilesForActiveCampaign() {
    let _self = this;

    this.awardService.ListTiles().subscribe(tiles => {
      this.listTiles = this.awardAdapter.TilesToTilesViewModel(tiles);
    }, error => this.ErrorHandler(error, _self));

    var numRows = (this.listTiles.length) / 6;

    for (var _i = 0; _i < numRows; _i++) {
        this.Rows[_i] = _i;
    }


  }


  ErrorHandler(error, _self) {
    _self.openMessagebox('Premios Belcorp', error.StateResponse.MensajeError, '3');
  } 

  ngOnDestroy() {
  }



}
