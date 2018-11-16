import { Component, OnInit, Inject, HostListener, ViewChild, ElementRef, Input } from '@angular/core';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA, MatSnackBar } from '@angular/material';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { CustomValidators } from '../../../../../../shared/custom-controls/custom-form-validators';
import { FormService, AuthUserService, SecurityService } from '../../../../../../services/index';
import { Router } from '@angular/router';

export interface DialogData {
  animal: string;
  name: string;
}

@Component({
  selector: 'password-change',
  templateUrl: './password-change.component.html',
  styleUrls: ['./password-change.component.scss']
})
export class PasswordChangeComponent implements OnInit {


  public formChangePass: FormGroup;
  oldPassword: string;
  newPassword: string;
  confirmPassword: string;
  hide = true;
  hideC = true;
  @Input() loading = false;

  constructor(
    private router: Router,
    private form: FormBuilder,
    public snackbar: MatSnackBar,
    private dialogRef: MatDialogRef<PasswordChangeComponent>,
    public FormService: FormService,
    public securityService: SecurityService,
    private authUserService: AuthUserService,
    @Inject(MAT_DIALOG_DATA) data) {

    this.oldPassword = data.oldPassword;
    this.newPassword = data.newPassword;
    this.confirmPassword = data.confirmPassword;
  }

  ngOnInit() {
    this.buildForm();
  }

  public formErrors = { 
    oldPassword: '',
    newPassword: '', 
    confirmPassword: '',
  };

  public buildForm() {
    this.formChangePass = this.form.group({
      oldPassword: ['', [Validators.required]],
      newPassword: ['', [Validators.required]],
      confirmPassword: ['', [Validators.required]] 
    });

    this.formChangePass.valueChanges.subscribe((data) => {
      this.formErrors = this.FormService.validateForm(this.formChangePass, this.formErrors, true);
    });
  }


  save() {
    this.FormService.markFormGroupTouched(this.formChangePass);

    if (this.formChangePass.valid) {
      this.loading = true;

      console.log(this.authUserService.getLoggedInUser().CodeUser);

      this.securityService.ChangePassword(this.authUserService.getLoggedInUser().CodeUser, this.formChangePass.get('oldPassword').value, this.formChangePass.get('confirmPassword').value).subscribe(ChangePassword => {
        //if (ChangePassword[0].Status == true) {
          this.snackbar.open("Se cambió la contraseña con éxito", 'Close', {
            duration: 3000,
          });
          this.loading = false;
          this.formChangePass.reset();
          this.dialogRef.close();  
        //} 
      }); 
    } else {
          this.formErrors = this.FormService.validateForm(this.formChangePass, this.formErrors, false);
    }

 } 

  close() {
    this.dialogRef.close();  
  }

}
