angular.module("anuncioApp.anuncios").factory( "AnuncioService", ["Anuncio","Cliente", "toaster", (Anuncio, Cliente, toaster) ->
  class AnuncioService 
    constructor: (id=undefined) ->
      if id 
        Anuncio.get(id).then (anuncio) =>
        @anuncio = anuncio
        Cliente.query().then (clientes) =>
          @clientes = clientes
          console.log @clientes
          @cliente  = _.find(@clientes, (item) -> item.id is anuncio.clienteId )
      else
        @anuncio = new Anuncio
        Cliente.query().then (clientes) =>
          @clientes = clientes
          
    guardar: =>
      @anuncio.clienteId = @clientes.id
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