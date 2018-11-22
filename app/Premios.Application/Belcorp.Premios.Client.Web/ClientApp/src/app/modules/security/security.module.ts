import { NgModule, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from '@angular/router';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { LoginComponent } from './components/login/login.component';
import { MaterialModule } from '../../shared/material';
import { NetworkManager } from '../../agents/networkmanager';
import { AwardService, FormService } from '../../services/';
import { SecurityAgent } from '../../agents/security/security-agent';
import { SecurityManagerComponent } from './containers/manager';
import { AwardAdapter } from '../../models/adapters/award-adapter';
import { AwardAgent } from '../../agents/award/award-agent';
import { NgxSpinnerModule } from 'ngx-spinner';


const routes: Routes = [

  {
    path: 'login', component: SecurityManagerComponent,
    children: [
      {
        outlet: 'security-manager',
        path: '',
        component: LoginComponent
      }
    ]
  },
  { path: '**', redirectTo: '/login', pathMatch: 'full' }
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
    NetworkManager,
    AwardService,
    AwardAdapter,
    AwardAgent,
    SecurityAgent,
    FormService
  ],
  declarations: [
    LoginComponent,
    SecurityManagerComponent
  ]
})
export class SecurityModule implements OnInit {

  constructor() {

  }

  ngOnInit() {
  }

}

