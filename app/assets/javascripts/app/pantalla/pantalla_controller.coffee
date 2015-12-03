angular.module("anuncioApp.pantallas").controller( "PantallaCtrl", ["$location","$http", "Pantalla","PantallaService", "toaster", ($location,$http,Pantalla,PantallaService, toaster) -> 
  @codigo  =""
  @mostrar = "true"
  self = @
  pantallaLocal = JSON.parse(localStorage.getItem('provincia'));
  if pantallaLocal
    $location.path('/pantallas/online');
  

  Pantalla.query().then (pantalla) =>
    @pantalla = []
    angular.forEach( pantalla, (item) =>
        if !item.configurada
          @pantalla.push item
      )
    # if @pantalla.length < 1
      # toaster.pop({type: 'success', title: "Pantalla #{@pantalla.descripcion} ", body: 'Configurada con exito'})

  
  @ConfigurarPantalla = (pantalla) =>
    if confirm( "Desea configurar #{pantalla.descripcion}")
      @servicio = new PantallaService pantalla,@pantalla

  @buscarPantalla = () =>
    if @codigo
      $http.get('/api/pantallas.json?codigo='+@codigo).success (data) ->
        if data.length 
          console.log "hay datos"
        else
          toaster.pop({type: 'info', title: "Pantalla", body: 'No encotrada'})

      return

  @eliminarPantalla = (pantalla) =>
    console.log pantalla
    if confirm( "Desea eliminar la Pantalla #{pantalla.descripcion}")
      pantalla.delete().then () =>
        toaster.pop({type: 'success', title: "Pantalla #{pantalla.descripcion}", body: 'Eliminada con exito'})
        @pantalla.splice( @pantalla.indexOf( pantalla ), 1 )

      , (e) =>
        texto = ""
        angular.forEach( e.data, (v,k) ->
          angular.forEach( v, (v2) ->
            texto += v2
          )
        )
        toaster.pop({type: 'error', title: "Pantalla #{pantalla.descripcion}", body: texto})
  return
])