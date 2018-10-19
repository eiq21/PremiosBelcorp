import { NgModule, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from '@angular/router';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AwardsManagerComponent } from './containers/manager';
import { BodyComponent } from './components/body/body.component';
import { TileComponent } from './components/tile/tile.component';
import { TilesComponent } from './components/tiles/tiles.component';
import { BannerComponent } from './components/banner/banner.component';
import { AwardService, AuthenticationService } from '../../services';
import { AwardAgent } from '../../agents/award/award-agent';
import { AwardAdapter } from '../../models/adapters/award-adapter';
import { DetailComponent } from './components/detail/detail.component';
import { MaterialModule } from '../../shared/material';
import { DetailSuggestionsComponent } from './components/detail/detail-suggestions/detail-suggestions.component';
import { DetailVoteComponent } from './components/detail/detail-vote/detail-vote.component';



const routes: Routes = [
  {
    path: '', component: AwardsManagerComponent,
    children: [
      {
        outlet: 'premios-manager',
        path: '',
        component: BodyComponent
      }
    ]
  },
  {
    path: 'detail/:id', component: AwardsManagerComponent,
    children: [
      {
        outlet: 'premios-manager',
        path: '',
        component: DetailComponent
      }
    ]
  },
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
    DetailComponent,
    DetailSuggestionsComponent,
    DetailVoteComponent,
    AwardsManagerComponent 
  ], 
  entryComponents: [

  ],
  exports: [
  ]
})
export class AwardsModule implements OnInit  {

   

  ngOnInit() { 

  }

}

