angular.module("anuncioApp.provincias").config ($routeProvider) ->
  $routeProvider
  .when("/admin/provincias/",
    templateUrl: "/assets/app/provincia/provincia.html"
    controller: "ProvinciaCtrl"
    controllerAs: "provincia"
    reloadOnSearch: false
  )
  .when("/admin/provincias/nueva",
    templateUrl: "/assets/app/provincia/form_provincia.html"
    controller: "ProvinciaNuevoCtrl"
    controllerAs: "provincia"
    reloadOnSearch: false
  )
  .when("/admin/provincias/:id/editar",
    templateUrl: "/assets/app/provincia/form_provincia.html"
    controller: "ProvinciaEditarCtrl"
    controllerAs: "provincia"
    reloadOnSearch: false
  )