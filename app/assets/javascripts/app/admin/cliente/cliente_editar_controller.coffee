angular.module("anuncioApp.clientes").controller( "ClienteEditarCtrl", [ "$routeParams", "ClienteService", ($routeParams, ClienteService) -> 

  self = @

  id = $routeParams.id
  
  @titulo = "Editar Cliente"

  @servicio = new ClienteService id 

  @guardar = @servicio.guardar

  return
])