import { NgModule, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from '@angular/router';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
//import { AwardsManagerComponent } from './containers/manager';
import { BodyComponent } from './components/body/body.component';
import { TileComponent } from './components/tile/tile.component';
import { TilesComponent } from './components/tiles/tiles.component';
import { BannerComponent } from './components/banner/banner.component';
import { AwardService } from '../../services';
import { AwardAgent } from '../../agents/award/award-agent';
import { AwardAdapter } from '../../models/adapters/award-adapter';
import { DetailComponent } from './components/detail/detail.component';
import { MaterialModule } from '../../shared/material';



const routes: Routes = [
  { path: '', component: BodyComponent },
  { path: 'detail/:id', component: DetailComponent },
  { path: '**', redirectTo: '/awards', pathMatch: 'full' }
];


@NgModule({
  imports: [
    MaterialModule,
    CommonModule,
    RouterModule.forChild(routes),
    FormsModule,
    ReactiveFormsModule
  ],
  providers: [
    AwardService,
    AwardAgent,
    AwardAdapter
  ],
  declarations: [ 
    BodyComponent,
    TileComponent,
    TilesComponent,
    BannerComponent,
    DetailComponent 
  ], 
  entryComponents: [

  ],
  exports: [
  ]
})
export class AwardsModule implements OnInit  {
  constructor(
  ) {
    
  }  

  ngOnInit() { 
    
    
  }

}

