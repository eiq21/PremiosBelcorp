import { Component, OnInit } from '@angular/core';
//import { MatIconRegistry } from '@angular/material';
import { DomSanitizer } from '@angular/platform-browser';

@Component({
  selector: 'prem-layout',
  templateUrl: './layout.component.html',
  styleUrls: ['./layout.component.scss']
})
export class LayoutComponent implements OnInit {

  //constructor(iconRegistry: MatIconRegistry, sanitizer: DomSanitizer) {
  constructor(sanitizer: DomSanitizer) {
    //iconRegistry.addSvgIcon('arrow-up-bold-circle', sanitizer.bypassSecurityTrustResourceUrl('./../../../assets/img/arrow-up-bold-circle.svg'));
    //iconRegistry.addSvgIcon('arrow-down-bold-circle', sanitizer.bypassSecurityTrustResourceUrl('./../../../assets/img/arrow-down-bold-circle.svg'));
    //iconRegistry.addSvgIcon('recycle-bin', sanitizer.bypassSecurityTrustResourceUrl('../../../../assets/img/recycle-bin.svg'));
    //iconRegistry.addSvgIcon('edit', sanitizer.bypassSecurityTrustResourceUrl('../../../../assets/img/edit.svg'));
    //iconRegistry.addSvgIcon('activate', sanitizer.bypassSecurityTrustResourceUrl('../../../../assets/img/activate.svg'));
    //iconRegistry.addSvgIcon('activate1', sanitizer.bypassSecurityTrustResourceUrl('../../../../assets/img/activate1.svg'));
    //iconRegistry.addSvgIcon('check', sanitizer.bypassSecurityTrustResourceUrl('../../../../assets/img/check.svg'));
  }

  ngOnInit() {
  }

}
