angular.module("anuncioApp.usuarios").factory( "UsuarioServiceAdmin", ["Usuario", "toaster", (Usuario, toaster) ->
  class UsuarioServiceAdmin 
    constructor: (id=undefined) ->
      @role = "Cliente"
      if id 
        Usuario.get(id).then (usuario) =>
          @role = "Admin"
          if usuario.role.id is 2
            @role = "Cliente"
          @usuario = usuario
      else
        @usuario = new Usuario

    guardar: =>
      idRole = 1
      if @role =="Cliente"
        idRole = 2

      @usuario.role.id = idRole
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