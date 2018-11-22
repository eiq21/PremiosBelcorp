import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'award-admin-manager',
  template: `    
    <router-outlet name="admin-manager"></router-outlet>
  `,
  styles: []
})
export class AdminManagerComponent implements OnInit {

  private _route: ActivatedRoute;
  isNew: boolean = false;

  constructor(route: ActivatedRoute) {
    this._route = route;
  }

  ngOnInit() {
  }



}
