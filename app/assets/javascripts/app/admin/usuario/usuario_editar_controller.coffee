angular.module("anuncioApp.usuarios").controller( "UsuarioEditarCtrlAdmin", [ "$routeParams", "UsuarioServiceAdmin", ($routeParams, UsuarioServiceAdmin) -> 

  self = @

  id = $routeParams.id
  
  @titulo = "Editar Usuario"

  @servicio = new UsuarioServiceAdmin id 

  @guardar = @servicio.guardar

  return
])