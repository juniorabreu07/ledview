angular.module("anuncioApp.anuncios").factory("Anuncio", ["railsResourceFactory", "railsSerializer", (railsResourceFactory, railsSerializer) ->
  resource = railsResourceFactory
    url: '/anuncios'
    name: 'anuncio'
    serializer: railsSerializer ->
      @exclude( "createdAt","updatedAt")
      @resource('cliente', 'Cliente' )
  return resource
])
