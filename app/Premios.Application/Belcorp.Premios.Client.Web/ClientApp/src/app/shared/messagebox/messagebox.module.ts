import { NgModule } from '@angular/core';
import { MessageboxDialogComponent } from '../../modules/core/components/messagebox/messagebox-dialog.component';
import { MaterialModule } from '../material/material.module';

@NgModule({
  imports: [
    MaterialModule
  ],
  declarations: [
    MessageboxDialogComponent
  ],
  exports: [
    MessageboxDialogComponent
  ]
})
export class MessageBoxModule {

}
