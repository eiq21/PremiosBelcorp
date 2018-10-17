import { Component, OnInit, ElementRef, OnDestroy, ViewChild } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { TileViewModel } from '../../../../modules/awards/viewmodels/index';
import { AwardService, AuthenticationService, SecurityService } from '../../../../services';
import { AwardAdapter } from '../../../../models/adapters/award-adapter';


@Component({
  selector: 'prem-premios-index',
  templateUrl: './body.component.html', 
  styleUrls: ['./body.component.scss']
}) 
export class BodyComponent implements OnInit, OnDestroy { 

  private _route: ActivatedRoute;  
  public listTiles: TileViewModel[];
  public Rows: number[];
  private awardService: AwardService;
  private awardAdapter: AwardAdapter;
  private as: AuthenticationService;
  private sc: SecurityService;

  constructor(route: ActivatedRoute,
    awardService: AwardService,
    awardAdapter: AwardAdapter,
    as: AuthenticationService,
    sc: SecurityService
  ) {
    this._route = route;

    this.awardService = awardService;
    this.awardAdapter = awardAdapter;
    this.as = as;
    //this.listTiles = new TileViewModel[];
    this.as.login("galileo\extswfhundred01", "Belcorp201810"); 

  
  }

  ngOnInit() {

    //this.PlayerVimeo = new Player();

    this.listTilesForActiveCampaign();
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
