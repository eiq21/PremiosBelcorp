import { Routes } from '@angular/router';
//import { SecurityGuardService } from './services/security-guard.service';
//import { LoginComponent } from './modules/security/components/login/login.component';

export const routes: Routes = [
  { path: '', redirectTo: '/awards', pathMatch: 'full' },
  {
    path: 'awards',
    loadChildren: './modules/awards/awards.module#AwardsModule',
    //canActivate: [SecurityGuardService],
    runGuardsAndResolvers: 'always'
  }
  //{
  //  path: 'security',
  //  loadChildren: './modules/security/security.module#SecurityModule',
  //  canActivateChild: [SecurityGuardService],
  //  runGuardsAndResolvers: 'always'
  //},
  //{
  //  path: 'maintenance',
  //  loadChildren: './modules/maintenance/maintenance.module#MaintenanceModule',
  //  canActivateChild: [SecurityGuardService],
  //  runGuardsAndResolvers: 'always'
  //}
];
