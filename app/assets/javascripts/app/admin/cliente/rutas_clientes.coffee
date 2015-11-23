angular.module("anuncioApp.clientes").config ($routeProvider) ->
  $routeProvider
  .when("/admin/clientes/",
    templateUrl: "/assets/app/admin/cliente/cliente.html"
    controller: "ClienteCtrl"
    controllerAs: "cliente"
    reloadOnSearch: false
  )
  .when("/admin/clientes/:id/editar",
    templateUrl: "/assets/app/admin/cliente/form_cliente.html"
    controller: "ClienteEditarCtrl"
    controllerAs: "cliente"
    reloadOnSearch: false
  )
  .when("/admin/clientes/nuevo",
    templateUrl: "/assets/app/admin/cliente/form_cliente.html"
    controller: "ClienteNuevoCtrl"
    controllerAs: "cliente"
    reloadOnSearch: false
  )
