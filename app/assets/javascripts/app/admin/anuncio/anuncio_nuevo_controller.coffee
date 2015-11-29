angular.module("anuncioApp.anuncios").controller( "AnuncioNuevoCtrlAdmin", [ "AnuncioServiceAdmin", ( AnuncioServiceAdmin ) -> 

  self = @

  @titulo = "Nuevo Anuncio admin" 
 
  @servicio = new AnuncioServiceAdmin

  @guardar = @servicio.guardar
  # @hora    = @servicio.time(@hora)
  @onSelect = @servicio.onSelect
  @onRemove = @servicio.onRemove
  
  return
])