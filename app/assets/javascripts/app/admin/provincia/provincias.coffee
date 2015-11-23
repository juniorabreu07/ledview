angular.module("anuncioApp.provincias").factory("Provincia", ["railsResourceFactory", "railsSerializer", (railsResourceFactory, railsSerializer) ->
  resource = railsResourceFactory
    url: '/api/provincias'
    name: 'provincia'
    serializer: railsSerializer ->
      @exclude( "createdAt","updatedAt")
  return resource
])
