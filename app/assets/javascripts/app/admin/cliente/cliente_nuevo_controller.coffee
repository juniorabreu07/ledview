angular.module("anuncioApp.clientes").controller( "ClienteNuevoCtrl", [ "ClienteService", ( ClienteService ) -> 

  self = @
  
  @titulo = "Nuevo Cliente"

  @servicio = new ClienteService

  @guardar = @servicio.guardar

  
  return
])