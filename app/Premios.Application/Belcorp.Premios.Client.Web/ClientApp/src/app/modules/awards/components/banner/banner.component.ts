import { Component, OnInit } from '@angular/core';
import Glide from '@glidejs/glide';
import Player from '@vimeo/player';

@Component({
  selector: 'prem-banner',
  templateUrl: './banner.component.html',
  styleUrls: ['./banner.component.scss']
})
export class BannerComponent implements OnInit {

  constructor() { }

  ngOnInit() {
    this.vimeoVideo()
    this.tabs()
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

}
