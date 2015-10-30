angular.module("anuncioApp.anuncios").controller( "AnuncioNuevoCtrl", [ "AnuncioService", ( AnuncioService ) -> 

  self = @
  
  @titulo = "Nuevo Anuncio"

  @servicio = new AnuncioService

  @guardar = @servicio.guardar

  @dt =new Date()
  console.log @dt
  return
])