import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { TooltipPosition } from '@angular/material';
import { FormControl } from '@angular/forms';

@Component({
  selector: 'upload-image',
  templateUrl: './upload-image.component.html',
  styleUrls: ['./upload-image.component.scss'] 
})
export class UploadImageComponent implements OnInit {

  @Output() onImagesChanged = new EventEmitter<Event>();

  positionOptions: TooltipPosition[] = ['after', 'before', 'above', 'below', 'left', 'right'];
  position = new FormControl(this.positionOptions[3]);


  constructor() { }

  ngOnInit() {
  }

}
