angular.module("anuncioApp.provincias").controller( "ProvinciaEditarCtrl", [ "$routeParams", "ProvinciaService", ($routeParams, ProvinciaService) -> 

  self = @

  id = $routeParams.id
  
  @titulo = "Editar Provincia"

  @servicio = new ProvinciaService id 

  @guardar = @servicio.guardar

  return
])