import { NgModule, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from '@angular/router';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AwardsManagerComponent } from './containers/manager';
import { BodyComponent } from '././components/home/body/body.component';
import { TileComponent } from '././components/home/tile/tile.component';
import { TilesComponent } from '././components/home/tiles/tiles.component';
import { BannerComponent } from '././components/home/banner/banner.component';
import { AwardService } from '../../services';
import { AwardAgent } from '../../agents/award/award-agent';
import { AwardAdapter } from '../../models/adapters/award-adapter';
import { DetailComponent } from './components/detail/detail.component';
import { MaterialModule } from '../../shared/material';
import { DetailSuggestionsComponent } from './components/detail/detail-suggestions/detail-suggestions.component';
import { DetailVoteComponent } from './components/detail/detail-vote/detail-vote.component';
import { NgxSpinnerModule } from 'ngx-spinner';
import { HomeComponent } from './components/home/home.component';
import { MenuListComponent } from './components/home/menu-list/menu-list.component';



const routes: Routes = [
  {
    path: '', component: AwardsManagerComponent,
    children: [
      {
        outlet: 'premios-manager',
        path: '',
        component: HomeComponent
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
    ],
    runGuardsAndResolvers: 'always'
  },
  { path: '**', redirectTo: '/awards', pathMatch: 'full' }
];


@NgModule({
  imports: [
    MaterialModule,
    CommonModule,
    RouterModule.forChild(routes),
    FormsModule,
    ReactiveFormsModule,
    NgxSpinnerModule
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
    AwardsManagerComponent,
    HomeComponent,
    MenuListComponent 
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

