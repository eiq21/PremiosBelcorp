import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { LoginViewModel } from '../../viewmodels/index';
import { FormService, AuthenticationService } from '../../../../services/index';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { CustomValidators } from '../../../../shared/custom-controls/custom-form-validators';
import { Constants } from '../../../../shared/utils';
import { MatSnackBar } from '@angular/material';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  public LoginVM: LoginViewModel;
  public loginForm: FormGroup;
  loading = false;

  constructor(
    private router: Router,
    public snackbar: MatSnackBar,
    public form: FormBuilder,
    public FormService: FormService,
    private authenticationService: AuthenticationService,
  ) { }

  ngOnInit() {
    this.LoginVM = new LoginViewModel();
    this.buildForm();
  }

  public formErrors = {
    username: '',
    password: '',
  };


  public buildForm() {
    this.loginForm = this.form.group({ 
      username: ['', [Validators.required, CustomValidators.validateCharacters]],
      password: ['', [Validators.required]]
    });

    this.loginForm.valueChanges.subscribe((data) => {
      this.formErrors = this.FormService.validateForm(this.loginForm, this.formErrors, true);
    });
  }



  Login() {

    this.FormService.markFormGroupTouched(this.loginForm);

    if (this.loginForm.valid) {
      this.loading = true;

      this.authenticationService.login(this.loginForm.get('username').value, this.loginForm.get('password').value).subscribe(result => {
        if (result == "") {
          this.router.navigateByUrl(Constants.Routes.HOME);
          this.loading = false;
        }
        else {
          this.snackbar.open(result, 'Close', {
            duration: 3000
          });

          this.loading = false;
          this.loginForm.reset();

        }
      });
    } else {
      this.formErrors = this.FormService.validateForm(this.loginForm, this.formErrors, false);
    }

  }

}
