angular.module("anuncioApp.usuarios").controller( "UsuarioEditarCtrl", [ "$routeParams", "UsuarioService", ($routeParams, UsuarioService) -> 

  self = @

  id = $routeParams.id
  
  @titulo = "Editar Usuario"

  @servicio = new UsuarioService id 

  @guardar = @servicio.guardar

  return
])