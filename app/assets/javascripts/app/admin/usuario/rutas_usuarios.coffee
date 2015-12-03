angular.module("anuncioApp.usuarios").config ($routeProvider) ->
  $routeProvider
  .when("/admin/usuarios/",
    templateUrl: "/assets/app/admin/usuario/usuario.html"
    controller: "UsuarioCtrl"
    controllerAs: "usuario"
    reloadOnSearch: false
  )
  .when("/admin/usuarios/:id/editar",
    templateUrl: "/assets/app/admin/usuario/form_usuario.html"
    controller: "UsuarioEditarCtrlAdmin"
    controllerAs: "usuario"
    reloadOnSearch: false
  )
  .when("/admin/usuarios/nuevo",
    templateUrl: "/assets/app/admin/usuario/form_usuario.html"
    controller: "UsuarioNuevoCtrlAdmin"
    controllerAs: "usuario"
    reloadOnSearch: false
  )
  