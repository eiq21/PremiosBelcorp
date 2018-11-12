import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'load-main',
  templateUrl: './load-main.component.html',
  styleUrls: ['./load-main.component.scss']
})
export class LoadMainComponent implements OnInit {

  panelOpenState = false;
  public isLoading = false;

  selectedFile: File;

  constructor() { }

  ngOnInit() {
  }

  onFileChanged(event) {
    this.selectedFile = event.target.files[0];
  }

}
