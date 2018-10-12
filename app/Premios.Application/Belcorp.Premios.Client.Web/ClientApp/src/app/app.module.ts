import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
//import { routes } from './routes';
import { RouterModule } from '@angular/router';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { CommonModule } from '@angular/common';
import { AppComponent } from './modules/core/containers/app';
import { CoreModule } from './modules/core/core.module';
//import { RouterStateSerializer } from '@ngrx/router-store';
//import { AuthInterceptor } from './agents/networkmanager/auth-interceptor';



@NgModule({
  imports: [
    CommonModule,
    BrowserModule,
    BrowserAnimationsModule,
    HttpClientModule,
    RouterModule.forRoot(
      [{ path: '', redirectTo: '/awards', pathMatch: 'full' },
      {
        path: 'awards',
        loadChildren: './modules/awards/awards.module#AwardsModule',
        //canActivate: [SecurityGuardService],
        runGuardsAndResolvers: 'always'
      }],
      { useHash: true, enableTracing: true }),
    FormsModule,
    //,
    //MessageBoxModule,
    CoreModule.forRoot()
  ],
  providers: [
    //{ provide: RouterStateSerializer, useClass: CustomRouterStateSerializer },
    //NetworkManager,
    //SecurityService,
    //SecurityAgent,
    //{ provide: HTTP_INTERCEPTORS, useClass: AuthInterceptor, multi: true }
  ],
  bootstrap: [AppComponent]
})
export class AppModule {  }
