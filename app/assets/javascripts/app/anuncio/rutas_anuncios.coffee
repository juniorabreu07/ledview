angular.module("anuncioApp.anuncios").config ($routeProvider) ->
  $routeProvider
  .when("/admin/anuncios/",
    templateUrl: "/assets/app/anuncio/anuncio.html"
    controller: "ClienteCtrl"
    controllerAs: "anuncio"
    reloadOnSearch: false
  )
  .when("/admin/anuncios/:id/editar",
    templateUrl: "/assets/app/anuncio/form_anuncio.html"
    controller: "ClienteEditarCtrl"
    controllerAs: "anuncio"
    reloadOnSearch: false
  )
  .when("/admin/anuncios/nuevo",
    templateUrl: "/assets/app/anuncio/form_anuncio.html"
    controller: "ClienteNuevoCtrl"
    controllerAs: "anuncio"
    reloadOnSearch: false
  )
