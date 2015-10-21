angular.module("anuncioApp.pantallas").factory( "PantallaService", ["Pantalla", "toaster", (Pantalla, toaster) ->
  class PantallaService 
    constructor: (id=undefined) ->
      if id 
        Pantalla.get(id).then (pantalla) =>
          @pantalla = pantalla
      else
        @pantalla = new Pantalla

    guardar: =>
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