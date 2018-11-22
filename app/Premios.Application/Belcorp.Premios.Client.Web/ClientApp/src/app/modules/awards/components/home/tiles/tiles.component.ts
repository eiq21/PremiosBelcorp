import { Component, OnInit, Input } from '@angular/core';
import { TileViewModel } from '../../../../../modules/awards/viewmodels/index';


@Component({
  selector: 'prem-tiles',
  templateUrl: './tiles.component.html',
  styleUrls: ['./tiles.component.scss']
})
export class TilesComponent implements OnInit { 

  @Input() listTiles: TileViewModel[]; 
  @Input() numTiles: number; 

  constructor(
  ) {

  }

  ngOnInit() {
    
  }



}
