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
      @resource('cliente', 'Cliente' )
      @resource('provincia', 'Provincia' )
      @nestedAttribute('anunciosProvincia');
  return resource
])


angular.module('anuncioApp.anuncios').filter('FileterTime', ->
  (ctimer) ->
    if ctimer != null
      ctimer = moment(ctimer).format("HH:mm:ss")
)

angular.module('anuncioApp.anuncios').filter('FilterDate', ->
  (date) ->
    if date != null
      date = moment(date).format("DD/MM/YYYY")
)