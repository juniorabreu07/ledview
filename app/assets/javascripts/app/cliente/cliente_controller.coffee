angular.module("anuncioApp.clientes").controller( "ClienteCtrl", [ "Cliente", "toaster", (Cliente, toaster) -> 

  self = @

  Cliente.query().then (cliente) =>
    @cliente = cliente


  # @eliminarUsuario = (usuario) =>
  #   if confirm( "Desea eliminar el Usuario #{usuario.nombre} #{usuario.apellido}")
  #     usuario.delete().then () =>
  #       toaster.pop({type: 'success', title: "Usuario #{usuario.nombre} #{usuario.apellido}", body: 'Eliminado con exito'})
  #       @usuarios.splice( @usuarios.indexOf( usuario ), 1 )
  #     , (e) =>
  #       texto = ""
  #       angular.forEach( e.data, (v,k) ->
  #         angular.forEach( v, (v2) ->
  #           texto += v2
  #         )
  #       )
  #       toaster.pop({type: 'error', title: "Usuario #{usuario.nombre} #{usuario.apellido}", body: texto})
  return
])