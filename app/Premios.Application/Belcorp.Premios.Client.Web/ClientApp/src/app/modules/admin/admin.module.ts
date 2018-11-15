import { NgModule, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from '@angular/router';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MaterialModule } from '../../shared/material';
import { NetworkManager } from '../../agents/networkmanager';
import { AwardService, FormService } from '../../services/';
import { SecurityAgent } from '../../agents/security/security-agent';
import { AdminManagerComponent } from './containers/manager';
import { AwardAdapter } from '../../models/adapters/award-adapter';
import { AwardAgent } from '../../agents/award/award-agent';
import { UploadFileComponent } from './components/shared/upload-file/upload-file.component';
import { LoadMainComponent } from './components/load-main/load-main.component';
import { UploadImageComponent } from './components/shared/upload-image/upload-image.component';


const routes: Routes = [
  {
    path: '', component: AdminManagerComponent,
    children: [
      {
        outlet: 'admin-manager',
        path: '',
        component: LoadMainComponent
      }
    ]
  },
  {
    path: 'admin', component: AdminManagerComponent,
    children: [
      { 
        outlet: 'admin-manager',
        path: '',
        component: LoadMainComponent
      } 
    ]
  },
  { path: '**', redirectTo: '/admin', pathMatch: 'full' }
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
    NetworkManager,
    AwardService,
    AwardAdapter,
    AwardAgent,
    SecurityAgent,
    FormService
  ],
  declarations: [
    AdminManagerComponent,
    UploadFileComponent,
    UploadImageComponent,
    LoadMainComponent
  ]
})
export class AdminModule implements OnInit {

  constructor() {

  }

  ngOnInit() {
  }

}

