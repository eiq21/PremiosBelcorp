import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { TooltipPosition } from '@angular/material';
import { FormControl } from '@angular/forms';

@Component({
  selector: 'upload-file',
  templateUrl: './upload-file.component.html',
  styleUrls: ['./upload-file.component.scss'] 
})
export class UploadFileComponent implements OnInit {

  @Output() onFileChanged = new EventEmitter<Event>();

  positionOptions: TooltipPosition[] = ['after', 'before', 'above', 'below', 'left', 'right'];
  position = new FormControl(this.positionOptions[3]);


  constructor() { }

  ngOnInit() {
  }

}
