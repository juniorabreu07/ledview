angular.module("anuncioApp.provincias").factory( "ProvinciaService", ["Provincia", "toaster", (Provincia, toaster) ->
  class ProvinciaService 
    constructor: (id=undefined) ->
      if id 
        Provincia.get(id).then (provincia) =>
          @provincia = provincia
      else
        @provincia = new Provincia

    guardar: =>
      @provincia.save().then () =>
        toaster.pop({type: 'success', title: "Provincia #{@provincia.nombre} #{@provincia.apellido}", body: 'Guardado con exito'})
      , (e) =>
        texto = ""
        angular.forEach( e.data, (v,k) ->
          angular.forEach( v, (v2) ->
            texto += v2
          )
        )
        toaster.pop({type: 'error', title: "Provincia #{@provincia.nombre} #{@provincia.apellido}", body: texto})
])