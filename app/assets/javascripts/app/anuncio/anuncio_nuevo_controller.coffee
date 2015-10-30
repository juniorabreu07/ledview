angular.module("anuncioApp.anuncios").controller( "AnuncioNuevoCtrl", [ "AnuncioService", ( AnuncioService ) -> 

  self = @
  @dt =new Date()

  @hora = @dt.getHours()+":"+@dt.getMinutes()+":"+@dt.getSeconds()+"."+@dt.getMilliseconds()

  @titulo = "Nuevo Anuncio"

  @servicio = new AnuncioService

  @guardar = @servicio.guardar

  console.log @dt
  return
])