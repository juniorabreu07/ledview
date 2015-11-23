angular.module("anuncioApp.pantallas").controller( "PantallaCtrl", [ "Pantalla", "toaster", (Pantalla, toaster) -> 

  self = @

  Pantalla.query().then (pantalla) =>
    @pantalla = pantalla


  @eliminarPantalla = (pantalla) =>
    if confirm( "Desea eliminar la Pantalla #{pantalla.descripcion}")
      pantalla.delete().then () =>
        toaster.pop({type: 'success', title: "Pantalla #{pantalla.descripcion}", body: 'Eliminada con exito'})
        @pantalla.splice( @pantalla.indexOf( pantalla ), 1 )
      , (e) =>
        texto = ""
        angular.forEach( e.data, (v,k) ->
          angular.forEach( v, (v2) ->
            texto += v2
          )
        )
        toaster.pop({type: 'error', title: "Pantalla #{pantalla.descripcion}", body: texto})
  return
])