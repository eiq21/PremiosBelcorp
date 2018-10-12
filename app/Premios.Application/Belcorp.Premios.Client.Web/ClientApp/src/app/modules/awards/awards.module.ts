import { NgModule, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from '@angular/router';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
//import { AwardsManagerComponent } from './containers/manager';
import { IndexComponent } from './components/index/index.component';

const routes: Routes = [
  { path: '', component: IndexComponent },
  { path: '**', redirectTo: '/awards', pathMatch: 'full' }
];


@NgModule({
  imports: [
    //MaterialModule,
    CommonModule,
    RouterModule.forChild(routes),
    FormsModule,
    ReactiveFormsModule
  ],
  providers: [

  ],
  declarations: [
    IndexComponent
  ],
  entryComponents: [

  ],
  exports: [
  ]
})
export class AwardsModule implements OnInit  {

  constructor() {

  }

  ngOnInit() {
  }

}

