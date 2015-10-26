angular.module("anuncioApp.anuncios").factory( "AnuncioService", ["Anuncio", "toaster", (Anuncio, toaster) ->
  class AnuncioService 
    constructor: (id=undefined) ->
      if id 
        Anuncio.get(id).then (anuncio) =>
          @anuncio = anuncio
      else
        @anuncio = new Anuncio

    guardar: =>
      @anuncio.save().then () =>
        toaster.pop({type: 'success', title: "Anuncio #{@anuncio.nombre} #{@anuncio.apellido}", body: 'Guardado con exito'})
      , (e) =>
        texto = ""
        angular.forEach( e.data, (v,k) ->
          angular.forEach( v, (v2) ->
            texto += v2
          )
        )
        toaster.pop({type: 'error', title: "Anuncio #{@anuncio.nombre} #{@anuncio.apellido}", body: texto})
])