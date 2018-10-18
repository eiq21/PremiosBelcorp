import { Component, OnInit, HostListener, OnDestroy, ViewEncapsulation  } from '@angular/core';
import { NavigationEnd } from '@angular/router';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-detail',
  templateUrl: './detail.component.html',
  encapsulation: ViewEncapsulation.None
  styleUrls: ['./detail.component.scss']
})
export class DetailComponent implements OnInit, OnDestroy {

  private TeamId: number;

  constructor(
    private route: ActivatedRoute, 
    private router: Router,
  ) {
    this.route.params.subscribe(params => this.TeamId = params['id']);
  }

  ngOnInit() {
  }

  ngOnDestroy() {

  }
}
