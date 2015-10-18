angular.module("anuncioApp.usuarios").config ($routeProvider) ->
  $routeProvider
  .when("/admin/usuarios/",
    templateUrl: "/assets/app/usuario/usuario.html"
    controller: "UsuarioCtrl"
    controllerAs: "usuario"
    reloadOnSearch: false
  )
  .when("/admin/usuarios/:id/editar",
    templateUrl: "/assets/app/usuario/form_usuario.html"
    controller: "UsuarioEditarCtrl"
    controllerAs: "usuario"
    reloadOnSearch: false
  )
  .when("/admin/usuarios/nuevo",
    templateUrl: "/assets/app/usuario/form_usuario.html"
    controller: "UsuarioNuevoCtrl"
    controllerAs: "usuario"
    reloadOnSearch: false
  )