angular.module("anuncioApp.pantallas").controller( "PantallaEditarCtrl", [ "$routeParams", "PantallaService", ($routeParams, PantallaService) -> 

  self = @

  id = $routeParams.id
  
  @titulo = "Editar Pantalla"

  @servicio = new PantallaService id 

  @guardar = @servicio.guardar

  return
])