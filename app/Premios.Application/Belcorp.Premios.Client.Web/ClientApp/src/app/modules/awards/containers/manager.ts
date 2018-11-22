import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'prem-premios-manager',
  template: `
    <router-outlet name="premios-manager">
    </router-outlet>
  `
})
export class AwardsManagerComponent implements OnInit  {

  private _route: ActivatedRoute;
  isNew: boolean = false;

  constructor(route: ActivatedRoute) {
    this._route = route;
  }

  ngOnInit() {
  }
}
