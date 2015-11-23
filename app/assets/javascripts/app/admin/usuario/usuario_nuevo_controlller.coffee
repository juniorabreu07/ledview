angular.module("anuncioApp.usuarios").controller( "UsuarioNuevoCtrl", [ "UsuarioService", ( UsuarioService ) -> 

  self = @
  
  @titulo = "Nuevo Usuario"

  @servicio = new UsuarioService

  @guardar = @servicio.guardar

  
  return
])