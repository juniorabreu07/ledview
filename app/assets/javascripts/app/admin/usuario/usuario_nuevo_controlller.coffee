angular.module("anuncioApp.usuarios").controller( "UsuarioNuevoCtrlAdmin", [ "UsuarioServiceAdmin", ( UsuarioServiceAdmin ) -> 

  self = @
  
  @titulo = "Nuevo Usuario"

  @servicio = new UsuarioServiceAdmin

  @guardar = @servicio.guardar

  
  return
])