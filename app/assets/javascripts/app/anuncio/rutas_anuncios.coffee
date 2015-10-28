angular.module("anuncioApp.anuncios").config ($routeProvider) ->
  $routeProvider
  .when("/admin/anuncios/",
    templateUrl: "/assets/app/anuncio/anuncio.html"
    controller: "AnuncioCtrl"
    controllerAs: "anuncio"
    reloadOnSearch: false
  )
  .when("/admin/anuncios/:id/editar",
    templateUrl: "/assets/app/anuncio/form_anuncio.html"
    controller: "AnuncioEditarCtrl"
    controllerAs: "anuncio"
    reloadOnSearch: false
  )
  .when("/admin/anuncios/nuevo",
    templateUrl: "/assets/app/anuncio/form_anuncio.html"
    controller: "AnuncioNuevoCtrl"
    controllerAs: "anuncio"
    reloadOnSearch: false
  )
