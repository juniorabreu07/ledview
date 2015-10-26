angular.module("anuncioApp.anuncios").controller( "ClienteNuevoCtrl", [ "AnuncioService", ( AnuncioService ) -> 

  self = @
  
  @titulo = "Nuevo Anuncio"

  @servicio = new AnuncioService

  @guardar = @servicio.guardar

  
  return
])