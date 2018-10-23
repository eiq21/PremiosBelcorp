import { Component, OnInit, Input } from '@angular/core';
import Player from '@vimeo/player';
import { TileViewModel } from '../../../../../modules/awards/viewmodels/index';

@Component({
  selector: 'prem-tile',
  templateUrl: './tile.component.html', 
  styleUrls: ['./tile.component.scss']
})
export class TileComponent implements OnInit {

  @Input() listTiles: TileViewModel[];
  @Input() Rows: number[] = new Array<number>();

  timeoutId: any = null;
  vimeoPlayer: any = null;
  //cont: any = null;

  constructor() { }

  ngOnInit() {


  }

  ViewVideo(i, videoCode) {

    var cont = i.target.firstElementChild;
    var idInsertVideo = null;
    idInsertVideo = cont.id;


    this.timeoutId = setTimeout(() => {
        if (this.vimeoPlayer) {
          this.vimeoPlayer.play().then(function () {
            // el video se reproduce
          }).catch(function (error) {
            switch (error.name) {
              case 'PasswordError':
                // El video necesita contraseña y no se puede ver
                break;

              case 'PrivacyError':
                // El video es privado
                break;

              default:
                // Algun otro error
                break;
            }
          })
        }

        this.vimeoPlayer = new Player(idInsertVideo, {
          id: videoCode,
          background: true
        })

        show(cont, 'block')

    }, 500);

    const show = (elem, visibility) => elem.style.display = visibility;
  }

  UnloadVideo(i) {


    var cont = i.target.firstElementChild;
    const hide = (elem, visibility) => elem.style.display = visibility;


    if (this.vimeoPlayer) {
      this.vimeoPlayer.unload().then(function () {
        // el player se descargó
      }).catch(function (error) {
        // ocurrio un error
      })
      clearTimeout(this.timeoutId)
      hide(cont, 'none') 

    }

    
  }


  

  ngOnDestroy() {
  }
}
