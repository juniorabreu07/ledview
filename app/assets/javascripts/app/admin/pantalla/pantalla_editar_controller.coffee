angular.module("anuncioApp.pantallas").controller( "PantallaEditarCtrl", [ "$routeParams", "PantallaServiceMain", ($routeParams, PantallaServiceMain) -> 

  self = @

  id = $routeParams.id
  
  @titulo = "Editar Pantalla"

  @servicio = new PantallaServiceMain id 

  @guardar = @servicio.guardar

  return
])