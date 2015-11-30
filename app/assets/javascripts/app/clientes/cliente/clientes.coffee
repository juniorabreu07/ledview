angular.module("anuncioApp.usuarios").factory("Usuario", ["railsResourceFactory", "railsSerializer", (railsResourceFactory, railsSerializer) ->
  resource = railsResourceFactory
    url: '/api/usuarios'
    name: 'usuario'
    serializer: railsSerializer ->
      @exclude( "createdAt","updatedAt")
  return resource
])
