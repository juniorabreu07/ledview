angular.module("anuncioApp.usuarios").factory("Usuario", ["railsResourceFactory", "railsSerializer", (railsResourceFactory, railsSerializer) ->
  resource = railsResourceFactory
    url: '/usuarios'
    name: 'usuario'
    serializer: railsSerializer ->
      @exclude( "createdAt","updatedAt")
  return resource
])

angular.module('anuncioApp.usuarios').filter('tipousario', ->
  (valor) ->
    if valor
      'Administrador'
    else
      'Usuario'
)
