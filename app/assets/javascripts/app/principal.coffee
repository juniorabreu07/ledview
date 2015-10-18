angular.module("anuncioApp",['ngRoute', 'ngResource', 'ngSanitize', 'ngAnimate', 'anuncioApp.subModulos', 'toaster'])
angular.module("anuncioApp.usuarios", [])
angular.module("anuncioApp.subModulos", ['rails','anuncioApp.usuarios'])

config = ($locationProvider, $httpProvider )->
  $locationProvider.html5Mode(
    enabled: true
    requireBase: false
  )
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = csrf_token



angular.module('anuncioApp').config(config)