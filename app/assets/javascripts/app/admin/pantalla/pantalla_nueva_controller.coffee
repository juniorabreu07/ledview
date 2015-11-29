angular.module("anuncioApp.pantallas").controller( "PantallaNuevaCtrl", [ "PantallaServiceMain", ( PantallaServiceMain ) -> 

  self = @
  
  @titulo = "Nueva Pantalla"
  console.log "admin"
  @servicio = new PantallaServiceMain

  @guardar = @servicio.guardar

  return
])