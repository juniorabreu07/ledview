angular.module("anuncioApp.provincias").controller( "ProvinciaCtrl", [ "Provincia", "toaster", (Provincia, toaster) -> 

  self = @

  Provincia.query().then (provincia) =>
    @provincia = provincia


  @eliminarProvincia = (provincia) =>
    if confirm( "Desea eliminar la Provincia #{provincia.nombre}")
      provincia.delete().then () =>
        toaster.pop({type: 'success', title: "Provincia #{provincia.nombre}", body: 'Eliminada con exito'})
        @provincia.splice( @provincia.indexOf( provincia ), 1 )
      , (e) =>
        texto = ""
        angular.forEach( e.data, (v,k) ->
          angular.forEach( v, (v2) ->
            texto += v2
          )
        )
        toaster.pop({type: 'error', title: "Provincia #{provincia.nombre}", body: texto})
  return
])