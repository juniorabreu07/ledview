angular.module("anuncioApp.clientes").factory("Cliente", ["railsResourceFactory", "railsSerializer", (railsResourceFactory, railsSerializer) ->
  resource = railsResourceFactory
    url: '/api/clientes'
    name: 'cliente'
    serializer: railsSerializer ->
      @exclude( "createdAt","updatedAt")
  return resource
])
