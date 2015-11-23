angular.module("anuncioApp.pantallas").config ($routeProvider) ->
  $routeProvider
  .when("/admin/pantallas/",
    templateUrl: "/assets/app/admin/pantalla/pantalla.html"
    controller: "PantallaCtrl"
    controllerAs: "pantalla"
    reloadOnSearch: false
  )
  .when("/admin/pantallas/nueva",
    templateUrl: "/assets/app/admin/pantalla/form_pantalla.html"
    controller: "PantallaNuevaCtrl"
    controllerAs: "pantalla"
    reloadOnSearch: false
  )
  .when("/admin/pantallas/:id/editar",
    templateUrl: "/assets/app/admin/pantalla/form_pantalla.html"
    controller: "PantallaEditarCtrl"
    controllerAs: "pantalla"
    reloadOnSearch: false
  )