//import { GrantedAccess } from "../dtos/granted-access";
//import { Process } from "../dtos/process";

export class UserModel {

  constructor() {
    //this.GrantedAccesses = new Array<GrantedAccess>();
    //this.Processes = new Array<Process>();
  }

  public Username: string;
  public isAdmin: boolean;
  public isExternal: boolean;
  public CodeUser: string;
  //public GrantedAccesses: GrantedAccess[];
  //public Processes: Process[];
}
