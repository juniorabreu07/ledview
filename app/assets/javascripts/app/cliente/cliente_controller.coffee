angular.module("anuncioApp.clientes").controller( "ClienteCtrl", [ "Cliente", "toaster", (Cliente, toaster) -> 

  self = @

  Cliente.query().then (clientes) =>
    @clientes = clientes


  @eliminarCliente = (cliente) =>
    if confirm( "Desea eliminar el Cliente #{cliente.nombre} #{cliente.apellido}")
      cliente.delete().then () =>
        toaster.pop({type: 'success', title: "Cliente #{cliente.nombre} #{cliente.apellido}", body: 'Eliminado con exito'})
        # @clientes.splice( @clientes.indexOf( cliente ), 1 )
      , (e) =>
        texto = ""
        angular.forEach( e.data, (v,k) ->
          angular.forEach( v, (v2) ->
            texto += v2
          )
        )
        toaster.pop({type: 'error', title: "Cliente #{cliente.nombre} #{cliente.apellido}", body: texto})
  return
])