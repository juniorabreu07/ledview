angular.module("anuncioApp",['ngRoute', 'ngResource', 'ngSanitize', 'ngAnimate', 'anuncioApp.subModulos', 'toaster','ui.select'])
angular.module("anuncioApp.usuarios", [])
angular.module("anuncioApp.clientes", [])
angular.module("anuncioApp.provincias",[])
angular.module("anuncioApp.pantallas", [])
angular.module("anuncioApp.anuncios", [])
angular.module("anuncioApp.subModulos", ['rails','anuncioApp.usuarios','anuncioApp.clientes','anuncioApp.provincias','anuncioApp.pantallas','anuncioApp.anuncios'])

config = ($locationProvider, $httpProvider )->
  $locationProvider.html5Mode(
    enabled: true
    requireBase: false
  )
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = csrf_token



angular.module('anuncioApp').config(config)