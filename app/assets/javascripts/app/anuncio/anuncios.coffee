angular.module("anuncioApp.anuncios").factory("Anuncio", ["railsResourceFactory", "railsSerializer", (railsResourceFactory, railsSerializer) ->
  resource = railsResourceFactory
    url: '/anuncios'
    name: 'anuncio'
    serializer: railsSerializer ->
      @exclude( "createdAt","updatedAt")
      @resource('cliente', 'Cliente' )
      @resource('provincia', 'Provincia' )
      @resource('anunciosProvincia', 'AnunciosProv' )
  return resource
])
angular.module('anuncioApp.anuncios').filter('date', ->
  (date) ->
    if date != null
      date =moment(date).utc().format("HH:mm:ss")
)
