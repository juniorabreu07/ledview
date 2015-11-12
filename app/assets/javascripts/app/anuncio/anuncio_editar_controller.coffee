angular.module("anuncioApp.anuncios").controller( "AnuncioEditarCtrl", [ "$routeParams", "AnuncioService", ($routeParams, AnuncioService) -> 

  self = @

  id = $routeParams.id
  
  @titulo = "Editar Anuncio"

  @servicio = new AnuncioService id 
  
  @guardar = @servicio.guardar
  return
])