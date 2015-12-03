angular.module("anuncioApp.pantallas").factory( "PantallaService", ["$location","Pantalla", "Provincia", "toaster", ($location,Pantalla, Provincia, toaster) ->
  class PantallaService 
    constructor: (id) ->
      if id 
        Pantalla.get(id).then (pantalla) =>
          @pantalla = pantalla
          Provincia.query().then (provincias) =>
            @provincias = provincias
            @provincia  = _.find(@provincias, (item) -> item.id is pantalla.provinciaId )
            this.guardar()

    # guardarArchivo: =>
    #   console.log "asdads"
    #   provincia ={
    #     id: "01",
    #     provinciaId: "02"
    #   }
    #   localStorage.setItem('provincia', JSON.stringify(provincia) );
    #   localData = JSON.parse(localStorage.getItem('provincia'));
    #   console.log localData
    #   # localStorage.clear()
    #   console.log localStorage.length

    guardar: =>
      provincia ={
        provinciaId: @provincia.id
        nombreProvincia: @provincia.nombre
        descripcion: @pantalla.descripcion
      }
      localStorage.setItem('provincia', JSON.stringify(provincia) );
      @pantalla.configurada = true
      @pantalla.save().then () =>
        toaster.pop({type: 'success', title: "Pantalla #{@pantalla.descripcion} ", body: 'Configurada con exito'})
        $location.path('/pantallas/online')
      , (e) =>
        texto = ""
        angular.forEach( e.data, (v,k) ->
          angular.forEach( v, (v2) ->
            texto += v2
          )
        )
        toaster.pop({type: 'error', title: "Pantalla #{@pantalla.descripcion} ", body: texto}) 
])