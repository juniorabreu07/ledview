angular.module("anuncioApp.clientes").config ($routeProvider) ->
  $routeProvider
  .when("/clientes/:id/editar",
    templateUrl: "/assets/app/clientes/cliente/form_cliente.html"
    controller: "ClienteEditarCtrl"
    controllerAs: "cliente"
    reloadOnSearch: false
  )
