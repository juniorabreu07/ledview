angular.module("anuncioApp.anuncios").factory( "AnuncioService", ["Anuncio","Cliente",'Provincia', "toaster", (Anuncio, Cliente,Provincia, toaster) ->
  class AnuncioService 
    constructor: (id=undefined) ->
      if id 
        Anuncio.get(id).then (anuncio) =>
          @anuncio = anuncio
          Cliente.query().then (clientes) =>
            @clientes = clientes
            @cliente  = _.find(@clientes, (item) -> item.id is anuncio.clienteId )
      else
        @anuncio = new Anuncio
        Cliente.query().then (clientes) =>
          @clientes = clientes
          Provincia.query().then (provincias) =>
            @provincias = provincias
            console.log @provincias
    


    guardar: =>
      @anuncio.clienteId = @cliente.id
      @anuncio.save().then () =>
        toaster.pop({type: 'success', title: "Anuncio ", body: 'Guardado con exito'})
      , (e) =>
        texto = ""
        angular.forEach( e.data, (v,k) ->
          angular.forEach( v, (v2) ->
            texto += v2
          )
        )
        toaster.pop({type: 'error', title: "Anuncio ", body: texto})
])