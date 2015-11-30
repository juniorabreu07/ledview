angular.module("anuncioApp.usuarios").config ($routeProvider) ->
  $routeProvider
  .when("/usuarios/:id/editar",
    templateUrl: "/assets/app/clientes/cliente/form_cliente.html"
    controller: "UsuarioEditarCtrl"
    controllerAs: "usuario"
    reloadOnSearch: false
  )
