angular.module("anuncioApp.usuarios").factory( "ClienteService", ["Cliente", "toaster", (Cliente, toaster) ->
  class ClienteService 
    constructor: (id=undefined) ->
      if id 
        Cliente.get(id).then (cliente) =>
          @cliente = cliente
    guardar: =>
      @cliente.save().then () =>
        toaster.pop({type: 'success', title: "Cliente #{@cliente.nombre} #{@cliente.apellido}", body: 'Guardado con exito'})
      , (e) =>
        texto = ""
        angular.forEach( e.data, (v,k) ->
          angular.forEach( v, (v2) ->
            texto += v2
          )
        )
        toaster.pop({type: 'error', title: "Cliente #{@cliente.nombre} #{@cliente.apellido}", body: texto})
])