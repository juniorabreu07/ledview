angular.module("anuncioApp.pantallas").controller( "PantallaNuevaCtrl", [ "PantallaService", ( PantallaService ) -> 

  self = @
  
  @titulo = "Nueva Pantalla"

  @servicio = new PantallaService

  @guardar = @servicio.guardar

  return
])