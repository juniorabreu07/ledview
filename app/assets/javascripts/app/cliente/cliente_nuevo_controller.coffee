angular.module("anuncioApp.clientes").controller( "ClienteNuevoCtrl", ["Cliente", "toaster", (Cliente, toaster) -> 

  self = @
  
  @titulo = "Nuevo Cliente"
  @cliente = new Cliente
  console.log "pasooo111"
  
  guardar: ->
      console.log "pasooo"
      # @cliente.save().then () =>
      #   toaster.pop({type: 'success', title: "Cliente #{@cliente.nombre} #{@cliente.apellido}", body: 'Guardado con exito'})
      # , (e) =>
      #   texto = ""
      #   angular.forEach( e.data, (v,k) ->
      #     angular.forEach( v, (v2) ->
      #       texto += v2
      #     )
      #   )
      #   toaster.pop({type: 'error', title: "Cliente #{@cliente.nombre} #{@cliente.apellido}", body: texto})
  
  return
])