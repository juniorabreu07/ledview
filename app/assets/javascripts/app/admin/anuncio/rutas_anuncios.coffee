angular.module("anuncioApp.anuncios").config ($routeProvider) ->
  $routeProvider
  .when("/admin/anuncios/",
    templateUrl: "/assets/app/admin/anuncio/anuncio.html"
    controller: "AnuncioCtrl"
    controllerAs: "anuncio"
    reloadOnSearch: false
  )
  .when("/admin/anuncios/:id/editar",
    templateUrl: "/assets/app/admin/anuncio/form_anuncio.html"
    controller: "AnuncioEditarCtrl"
    controllerAs: "anuncio"
    reloadOnSearch: false
  )
  .when("/admin/anuncios/nuevo",
    templateUrl: "/assets/app/admin/anuncio/form_anuncio.html"
    controller: "AnuncioNuevoCtrlAdmin"
    controllerAs: "anuncio"
    reloadOnSearch: false
  )
