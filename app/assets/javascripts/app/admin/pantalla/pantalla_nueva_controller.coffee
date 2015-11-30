angular.module("anuncioApp.pantallas").controller( "PantallaNuevaCtrl", [ "PantallaServiceMain", ( PantallaServiceMain ) -> 

  self = @
  
  @titulo = "Nueva Pantalla"
  @servicio = new PantallaServiceMain

  @guardar = @servicio.guardar

  return
])