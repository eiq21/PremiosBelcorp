import { Component, OnInit, ElementRef, OnDestroy, ViewChild } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import Glide  from '@glidejs/glide';
import Player from '@vimeo/player';

@Component({
  selector: 'prem-premios-index',
  template: ` 
    <router-outlet name="premios-index">
    </router-outlet>  
  `,
  templateUrl: './index.component.html', 
  styleUrls: ['./index.component.scss']
}) 
export class IndexComponent implements OnInit, OnDestroy { 

  private _route: ActivatedRoute;  
  //public PlayerVimeo: Player;
  //public GlideJS: Glide;
  isNew: boolean = false;
  elRef: ElementRef;

  @ViewChild("videoItemsComponent") videoItemsComponent: ElementRef;
  
   
  constructor(route: ActivatedRoute

  ) {
    this._route = route;
  }

  ngOnInit() {

    //this.PlayerVimeo = new Player();

    this.vimeoVideo()
    this.tabs()

  }


  ngAfterViewInit() {
    this.previewVideo()
  }

  ngOnDestroy() {
  }

  vimeoVideo() {
    const d = document,
      vimeoWrapper = Array.prototype.slice.call(d.querySelectorAll('.Vimeo-wrapper')),
      t = d.getElementById('videoTitle')

    let vimeoTagID, vimeoID, player = {}, action
    
    vimeoWrapper.map((elem, index) => {

      vimeoTagID = elem.getAttribute('id')
      vimeoID = elem.getAttribute('data-vimeo-id')

      

      player[index] = new Player(vimeoTagID, {
        id: vimeoID,
        muted: false,
        autoplay: true
      })

      player[index].getVideoTitle().then(function (title) {
        t.innerText = title
        console.log('title:', title)
      })

    })
  }

 _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

  tabs() {
    const options = {
      type: 'carousel',
      startAt: 0,
      classes: {
        activeNav: 'AccessItemActive'
      }
    }

    const carrusel = new Glide('.pb', options)
    const vol = document.getElementById('volume')
      

    let vimeoPlayer, vimeoPlayertwo
    const videoPortada = document.querySelector('.VimeoPlayerVideo')
    // ! insertar el video de fondo antes que arranque el carrusel

    if (document.querySelector('div.pb')) {
      vimeoPlayer = new Player('insertPlayerOnInitSlide', {
        id: 291800076,
        background: true
      })

      vimeoPlayertwo = new Player('insertPlayerOnLastSlide', {
        id: 291800076,
        background: false
      })

      /**
      *  Subir y bajar el volumen de primer video de slide 
      * busca el id volumeUp y lo almacena en vol
      */

      vol.addEventListener('click', (e) => {

        const target = e.target

        e.preventDefault()
        volUpDown(vol.getAttribute('data-action-volume'))

        //   target.getAttribute

        //   vimeoTagID = elem.getAttribute('id')



        //   if(target.className === 'fa fa-volume-off'){
        //     volUpDown(target, 'off')
        //     // alert('click 1')
        //   }
        //   if(target.className === 'fa fa-volume-up'){
        //     volUpDown(target, 'up')
        //     // alert('click 2')
        //   }


      })

      // ! correr el carrusel 
      carrusel.mount()
    }

    // ! Detectar los eventos del clic para llamar eventos de vimeo

    carrusel.on('run.after', (move) => {

      // * Detectar si se hizo clic en el boton 2 pausa el video
      if (move.direction === '=' && move.steps === '0') {
        vimeoPlayer.play().then(function () {
          // the video was paused
        }).catch(function (error) {
          switch (error.name) {
            case 'PasswordError':
              // the video is password-protected and the viewer needs to enter the
              // password first
              break;

            case 'PrivacyError':
              // the video is private
              break;

            default:
              // some other error occurred
              break;
          }
        })
        console.log('Clic en boton ' + move.steps)

        vol.style.display = 'block'
      }

      if (move.direction === '=' && move.steps === '1' || move.direction === '=' && move.steps === '2') {

        vimeoPlayer.pause().then(function () {
          // the video was paused
        }).catch(function (error) {
          switch (error.name) {
            case 'PasswordError':
              // the video is password-protected and the viewer needs to enter the
              // password first
              break;

            case 'PrivacyError':
              // the video is private
              break;

            default:
              // some other error occurred
              break;
          }
        })

        console.log('Clic en boton ' + move.steps)

        vol.style.display = 'none'

      }

      console.log(move)

    })

    if (videoPortada) {

      window.addEventListener('resize', () => resize(), false)

      const resize = () => {

        const container: any = document.querySelector('.pb')
        const alto = (videoPortada as any).offsetHeight
        const ancho = (videoPortada as any).offsetWidth

        // Current inner height of the browser window (in pixels)
        let iH = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight

        // Current inner width of the browser window (in pixels)
        let iW = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth

        container.style.height = alto + 'px' 
      }

      resize()

    }


    // document.querySelector('.Up .fa').classList

    const volUpDown = (offUp) => {

      const icon = document.querySelector('.Up .fa')


      icon.classList.remove(offUp == false ? 'fa-volume-off' : 'fa-volume-up')
      icon.classList.add(offUp == false ? 'fa-volume-up' : 'fa-volume-off')
      vimeoPlayer.setVolume(offUp == true ? 0 : 1).then(function (volume) {
        // volume was set
      }).catch(function (error) {
        switch (error.name) {
          case 'RangeError':
            // Error de parámetro
            break;

          default:
            // otro tipo de error
            break;
        }
      })
      offUp == false ? vol.setAttribute('data-action-volume', "1") : vol.setAttribute('data-action-volume', "0")


    }

  }

  previewVideo() {

    var rowCards = this.videoItemsComponent.nativeElement.ownerDocument.querySelectorAll(".pbVimeoItem");
    var nodeVimeoItems = null;
    var card = null;
    var cont = null;
    //var vimeoPreview = null;
    var idInsertVideo = null;
    var timeoutId = null,
      vimeoPlayer = null
    

    rowCards.forEach(rc => {
      nodeVimeoItems = rc.querySelectorAll(".tile");

      nodeVimeoItems.forEach(vi => {

        card = vi;
        cont = vi.querySelector('.inserCont');
        timeoutId = null;
        //vimeoPlayer = null;
        //vimeoPreview = null;
        idInsertVideo = cont.id;

        if (card) {

          card.addEventListener('mouseover', (e) => {
            timeoutId = setTimeout(() => {
              console.log(cont.id);
              if (vimeoPlayer) {
                vimeoPlayer.play().then(function () {
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

              vimeoPlayer = new Player(idInsertVideo, {
                id: 292172861,
                background: true
              })

              show(cont, 'block')

            }, 500);
          })

          card.addEventListener('mouseout', (e) => {

            if (vimeoPlayer) {
              vimeoPlayer.unload().then(function () {
                // el player se descargó
              }).catch(function (error) {
                // ocurrio un error
              })
              clearTimeout(timeoutId)
              show(cont, 'none')

            }

          })

        }



      });
        
    });

    const show = (elem, visibility) => elem.style.display = visibility

    //if (card) {

    //  card.addEventListener('mouseover', (e) => {
    //    timeoutId = setTimeout(() => {

    //      if (vimeoPlayer) {
    //        vimeoPlayer.play().then(function () {
    //          // el video se reproduce
    //        }).catch(function (error) {
    //          switch (error.name) {
    //            case 'PasswordError':
    //              // El video necesita contraseña y no se puede ver
    //              break;

    //            case 'PrivacyError':
    //              // El video es privado
    //              break;

    //            default:
    //              // Algun otro error
    //              break;
    //          }
    //        })
    //      }

    //      vimeoPlayer = new Player(`insertVimeoPreview`, {
    //        id: 292172861,
    //        background: true
    //      })

    //      show(cont, 'block')

    //    }, 500);
    //  })

    //  card.addEventListener('mouseout', (e) => {

    //    if (vimeoPlayer) {
    //      vimeoPlayer.unload().then(function () {
    //        // el player se descargó
    //      }).catch(function (error) {
    //        // ocurrio un error
    //      })
    //      clearTimeout(timeoutId)
    //      show(cont, 'none') 
    //    }

    //  })

    //}

    //const show = (elem, visibility) => elem.style.display = visibility


  }
}
