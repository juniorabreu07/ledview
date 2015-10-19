angular.module("anuncioApp.clientes").factory("Cliente", ["railsResourceFactory", "railsSerializer", (railsResourceFactory, railsSerializer) ->
  resource = railsResourceFactory
    url: '/clientes'
    name: 'cliente'
  return resource
])
