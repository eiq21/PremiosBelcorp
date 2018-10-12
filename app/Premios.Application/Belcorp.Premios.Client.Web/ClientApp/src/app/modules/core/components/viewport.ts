import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'prem-viewport',
  template: `<div class="viewport"><prem-layout><router-outlet></router-outlet></prem-layout><div>`

})
export class ViewportComponent implements OnInit {

  constructor() { }

  ngOnInit() {
  }

}
