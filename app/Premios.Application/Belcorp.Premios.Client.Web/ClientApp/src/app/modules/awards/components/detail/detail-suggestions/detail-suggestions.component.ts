import { Component, OnInit, Input, OnDestroy } from '@angular/core';
import { SuggestionsViewModel } from '../../../viewmodels';
import { ActivatedRoute, Router, NavigationEnd } from '@angular/router';

@Component({
  selector: 'detail-suggestions',
  templateUrl: './detail-suggestions.component.html',
  styleUrls: ['./detail-suggestions.component.scss']
})
export class DetailSuggestionsComponent implements OnInit, OnDestroy {

  @Input() listSuggestion: SuggestionsViewModel[]; 
  private _route: ActivatedRoute;
  public interval: any;
  @Input() modalPublic: any;

  constructor(
    private route: ActivatedRoute,
    private router: Router
  ) {

  }

  ngOnInit() {
  }

  goToOtherVideo(teamId) {

   //this.modalPublic.close();   
    this.router.navigate(['/awards/detail/', teamId]);

  }
  

  ngOnDestroy() {
  }

}
