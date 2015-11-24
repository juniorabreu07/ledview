angular.module("anuncioApp.anuncios").controller( "AnuncioEditarCtrl", [ "$scope", "$routeParams", "AnuncioService", ($scope, $routeParams, AnuncioService) -> 

  self = @

  id = $routeParams.id
  
  @titulo = "Editar Anuncio cliente"

  @servicio = new AnuncioService id 
   
  @guardar = @servicio.guardar

  @onSelect = @servicio.onSelect
  @onRemove = @servicio.onRemove
  @readFile = @servicio.readFile
  @readVideo = (file) =>
    @servicio.readVideo(file)
    #$scope.interface.sources.add(@servicio.video) if @servicio.video

  $scope.interface = {};

  $scope.$on('$videoReady', =>

    $scope.interface.options.setAutoplay(true)
    $scope.interface.sources.add(@servicio.video) if @servicio.video
    console.log "cargando video", @servicio.video
    # $scope.interface.sources.add()
  )

  # @mostrar = ($file) =>
  #   console.log $file
  #   #console.log @servicio.archivo

  return
])