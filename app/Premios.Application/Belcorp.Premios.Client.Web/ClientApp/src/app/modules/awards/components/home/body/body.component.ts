import { Component, OnInit, OnDestroy, Input } from '@angular/core';
import { TileViewModel, BannerViewModel } from '../../../../../modules/awards/viewmodels/index';



@Component({
  selector: 'premios-body',
  templateUrl: './body.component.html', 
  styleUrls: ['./body.component.scss']
}) 
export class BodyComponent implements OnInit, OnDestroy { 

  @Input() listTiles: TileViewModel[];
  @Input() numTiles: number[];

   
  constructor(
  ) {
  }

  ngOnInit() {
  }

  ngOnDestroy() {
  }



}
