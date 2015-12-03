angular.module("anuncioApp.pantallas").factory("Pantalla", ["railsResourceFactory", "railsSerializer", (railsResourceFactory, railsSerializer) ->
  resource = railsResourceFactory
    url: '/api/pantallas'
    name: 'pantalla'
    serializer: railsSerializer ->
      @exclude( "createdAt","updatedAt")
      @resource('provincia', 'Provincia' )
  return resource
])

angular.module('anuncioApp.anuncios').filter('configurada', ->
  (conf) ->
  	if conf
  		"Configurada"
  	else
  		"No Configurada"
)
