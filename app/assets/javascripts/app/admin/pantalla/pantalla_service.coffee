angular.module("anuncioApp.pantallas").factory( "PantallaServiceMain", ["Pantalla", "Provincia", "toaster", (Pantalla, Provincia, toaster) ->
  class PantallaServiceMain 
    constructor: (id=undefined) ->
      if id 
        Pantalla.get(id).then (pantalla) =>
          @pantalla = pantalla
          Provincia.query().then (provincias) =>
            @provincias = provincias
            @provincia = _.find(@provincias, (item) -> item.id is pantalla.provinciaId )
      else
        @pantalla = new Pantalla
        Provincia.query().then (provincias) =>
          @provincias = provincias

    guardar: =>
      @pantalla.provinciaId = @provincia.id
      @pantalla.save().then () =>
        toaster.pop({type: 'success', title: "Pantalla #{@pantalla.descripcion} ", body: 'Guardado con exito'})
      , (e) =>
        texto = ""
        angular.forEach( e.data, (v,k) ->
          angular.forEach( v, (v2) ->
            texto += v2
          )
        )
        toaster.pop({type: 'error', title: "Pantalla #{@pantalla.descripcion} ", body: texto})
])