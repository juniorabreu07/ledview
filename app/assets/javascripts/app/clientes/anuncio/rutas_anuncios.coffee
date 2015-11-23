angular.module("anuncioApp.anuncios").config ($routeProvider) ->
  $routeProvider
  .when("/anuncios/",
    templateUrl: "/assets/app/clientes/anuncio/anuncio.html"
    controller: "AnuncioCtrl"
    controllerAs: "anuncio"
    reloadOnSearch: false
  )
  .when("/anuncios/:id/editar",
    templateUrl: "/assets/app/clientes/anuncio/form_anuncio.html"
    controller: "AnuncioEditarCtrl"
    controllerAs: "anuncio"
    reloadOnSearch: false
  )
  .when("/anuncios/nuevo",
    templateUrl: "/assets/app/clientes/anuncio/form_anuncio.html"
    controller: "AnuncioNuevoCtrl"
    controllerAs: "anuncio"
    reloadOnSearch: false
  )
