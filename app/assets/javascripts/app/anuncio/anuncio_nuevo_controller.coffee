angular.module("anuncioApp.anuncios").controller( "AnuncioNuevoCtrl", [ "AnuncioService", ( AnuncioService ) -> 

  self = @

  @titulo = "Nuevo Anuncio"
 
  @servicio = new AnuncioService

  @guardar = @servicio.guardar
  # @hora    = @servicio.time(@hora)
  @onSelect = @servicio.onSelect
  @onRemove = @servicio.onRemove
  
  return
])