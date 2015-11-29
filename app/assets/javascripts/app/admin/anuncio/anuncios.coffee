angular.module("anuncioApp.anuncios").factory("AnuncioProvincia", ["railsResourceFactory", "railsSerializer", (railsResourceFactory, railsSerializer) ->
  resource = railsResourceFactory
    name: 'anunciosProvincia'
  return resource
])


angular.module("anuncioApp.anuncios").factory("Anuncio", ["railsResourceFactory", "railsSerializer", (railsResourceFactory, railsSerializer) ->
  resource = railsResourceFactory
    url: '/api/anuncios'
    name: 'anuncio'
    serializer: railsSerializer ->
      @exclude( "createdAt","updatedAt")
      @resource('usuario', 'Usuario' )
      @resource('provincia', 'Provincia' )
      @nestedAttribute('anunciosProvincia');
  return resource
])


angular.module('anuncioApp.anuncios').filter('date', ->
  (date) ->
    if date != null
      date =moment(date).utc().format("HH:mm:ss")
)
