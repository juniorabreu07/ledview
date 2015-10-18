angular.module("anuncioApp.usuarios").factory( "UsuarioService", ["Usuario", "toaster", (Usuario, toaster) ->
  class UsuarioService 
    constructor: (id=undefined) ->
      if id 
        Usuario.get(id).then (usuario) =>
          @usuario = usuario
      else
        @usuario = new Usuario

    guardar: =>
      @usuario.save().then () =>
        toaster.pop({type: 'success', title: "Usuario #{@usuario.nombre} #{@usuario.apellido}", body: 'Guardado con exito'})
      , (e) =>
        texto = ""
        angular.forEach( e.data, (v,k) ->
          angular.forEach( v, (v2) ->
            texto += v2
          )
        )
        toaster.pop({type: 'error', title: "Usuario #{@usuario.nombre} #{@usuario.apellido}", body: texto})
])