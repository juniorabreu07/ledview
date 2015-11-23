angular.module("anuncioApp.provincias").controller( "ProvinciaNuevoCtrl", [ "ProvinciaService", ( ProvinciaService ) -> 

  self = @
  
  @titulo = "Nueva Provincia"

  @servicio = new ProvinciaService

  @guardar = @servicio.guardar

  
  return
])