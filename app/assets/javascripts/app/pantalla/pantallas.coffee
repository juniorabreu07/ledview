angular.module("anuncioApp.pantallas").factory("Pantalla", ["railsResourceFactory", "railsSerializer", (railsResourceFactory, railsSerializer) ->
  resource = railsResourceFactory
    url: '/pantallas'
    name: 'pantalla'
    serializer: railsSerializer ->
      @exclude( "createdAt","updatedAt")
  return resource
])
