angular.module("anuncioApp.anuncios").controller( "AnuncioCtrl", [ "Anuncio", "toaster", (Anuncio, toaster) -> 

  self = @

  Anuncio.query().then (anuncios) =>
    @anuncios = anuncios
    

  @eliminarAnuncio = (cliente) =>
    if confirm( "Desea eliminar el Anuncio #{cliente.nombre} #{cliente.apellido}")
      cliente.delete().then () =>
        toaster.pop({type: 'success', title: "Anuncio #{cliente.nombre} #{cliente.apellido}", body: 'Eliminado con exito'})
        @anuncios.splice( @anuncios.indexOf( cliente ), 1 )
      , (e) =>
        texto = ""
        angular.forEach( e.data, (v,k) ->
          angular.forEach( v, (v2) ->
            texto += v2
          )
        )
        toaster.pop({type: 'error', title: "Anuncio #{cliente.nombre} #{cliente.apellido}", body: texto})
  return
])