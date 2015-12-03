angular.module("anuncioApp.pantallas").config ($routeProvider) ->
  $routeProvider
  .when("/pantallas",
    templateUrl: "/assets/app/pantalla/pantalla.html"
    controller: "PantallaCtrl"
    controllerAs: "pantalla"
    reloadOnSearch: false
  )
  .when("/pantallas/online",
    templateUrl: "/assets/app/pantalla/mostrar.html"
    controller: "PantallaMostrarCtrl"
    controllerAs: "pantalla"
    reloadOnSearch: false
  )
