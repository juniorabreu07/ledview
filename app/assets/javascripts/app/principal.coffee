angular.module("anuncioApp",['ngRoute', 'ngResource', 'ngSanitize', 'ngAnimate', 'anuncioApp.subModulos', 'toaster','ui.select', "ngFileUpload", "ngVideo", "blockUI"])
angular.module("anuncioApp.usuarios", [])
angular.module("anuncioApp.clientes", [])
angular.module("anuncioApp.provincias",[])
angular.module("anuncioApp.pantallas", [])
angular.module("anuncioApp.anuncios", [])
angular.module("anuncioApp.subModulos", ['rails','anuncioApp.usuarios','anuncioApp.clientes','anuncioApp.provincias','anuncioApp.pantallas','anuncioApp.anuncios'])

config = ($locationProvider, $httpProvider, blockUIConfig)->
  $locationProvider.html5Mode(
    enabled: true
    requireBase: false
  )
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = csrf_token

  blockUIConfig.message = "Por favor espere!"
  blockUIConfig.delay = 500


angular.module('anuncioApp').config(config)