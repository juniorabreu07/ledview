angular.module("anuncioApp.pantallas").factory("Pantalla", ["railsResourceFactory", "railsSerializer", (railsResourceFactory, railsSerializer) ->
  resource = railsResourceFactory
    url: '/pantallas'
    name: 'pantalla'
    serializer: railsSerializer ->
      @exclude( "createdAt","updatedAt")
      @resource('provincia', 'Provincia' )
  return resource
])
