import { Component, OnInit, HostListener } from '@angular/core';
import { AuthUserService } from '../../../../../services';
import { ActivatedRoute, Router } from '@angular/router';
import { Constants } from '../../../../../shared/utils';
import { MatDialog, MatDialogConfig } from '@angular/material';
import { PasswordChangeComponent } from '../shared/password-change/password-change.component';

@Component({
  selector: 'menu-list',
  templateUrl: './menu-list.component.html',
  styleUrls: ['./menu-list.component.scss']
})
export class MenuListComponent implements OnInit {

  public userName = null;
  public isAdmin = null;
  public isExternal = null;
  animal: string;
  name: string;

  constructor(
    private authUserService: AuthUserService,
    private route: ActivatedRoute,
    private router: Router,
    public dialog: MatDialog
  ) { }

  ngOnInit() {
    this.userName = this.authUserService.getLoggedInUser().Username;
    this.isAdmin = this.authUserService.isAdmin();
    this.isExternal = this.authUserService.isExternal();
  }

  gotoChangePassword(): void {
    const dialogConfig = new MatDialogConfig();

    dialogConfig.disableClose = true;
    dialogConfig.autoFocus = true;
    dialogConfig.width = '400px';
    dialogConfig.data = {
      id: 1,
      title: 'Password Manager'
    };

    this.dialog.open(PasswordChangeComponent, dialogConfig);

    //dialogRef.afterClosed().subscribe(
    //  data => console.log("Dialog output:", data)
    //); 
  }



  viewMenu() {
    this.isShowingSidebar() ? this.hideSidebar() : this.showSidebar();
  }

  showSidebar() {
    this.getContainer().classList.add('show-sidebar');
  }

  hideSidebar() {
    this.getContainer().classList.remove('show-sidebar');
  }
 
  isShowingSidebar() {
    return this.getContainer().classList.contains('show-sidebar');
  }

  getContainer(): HTMLElement {
    let container: HTMLElement = null;
    container = document.querySelector('.pb_container');

    return container;
  }

  goToAdminPage() {
    this.router.navigate(['/admin/']);
  }

  logOutSession() {
    this.authUserService.LogOutUser();
    this.router.navigate([Constants.Routes.LOGIN]);
  }


}
