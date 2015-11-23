angular.module("anuncioApp.anuncios").factory( "AnuncioService", [ "$http", "Anuncio", "AnuncioProvincia", "Cliente",'Provincia', "toaster", "Upload", ($http, Anuncio, AnuncioProvincia, Cliente,Provincia, toaster, Upload) ->
  class AnuncioService 
    constructor: (id=undefined) ->
      @provinciasSeleccionadas = []
      @archivo = undefined
      @imagen  = undefined
      this.items = ['Texto', 'Imagen', 'Video']
      if id 
        Anuncio.get(id).then (anuncio) =>
          anuncio.hora = moment(anuncio.hora).utc().toDate()        
          @anuncio = anuncio
          @imagen  = anuncio.cfile.cfile.image320x240.url if anuncio.tipo == 'Imagen'
          @video   = anuncio.video.video.url if anuncio.tipo == 'Video'
          # $http.get(@video).then (a) ->
          #   console.log a
          # document.getElementById('imagen').src = anuncio.cfile
          Cliente.query().then (clientes) =>
            @clientes = clientes
            @cliente  = _.find(@clientes, (item) -> item.id is anuncio.clienteId ) 
            Provincia.query().then (provincias) =>  
              @provincias = provincias
              angular.forEach( anuncio.anunciosProvincia, (item) =>
                encontrada = _.find( provincias, (valor) -> valor.id is item.provinciaId )
                @provinciasSeleccionadas.push encontrada
              )
              temp = @anuncio.anunciosProvincia 
              @anuncio.anunciosProvincia = []
              angular.forEach( temp, (item) =>
                valor = new AnuncioProvincia( provinciaId: item.provinciaId, _destroy: "0",id: item.id)
                @anuncio.anunciosProvincia.push valor
              )
              
      else
        @anuncio                   = new Anuncio
        @anuncio.tipo              = "Texto"
        @anuncio.estado            = "Inactivo"
        @anuncio.anunciosProvincia = []
        Cliente.query().then (clientes) =>
          @clientes = clientes
          Provincia.query().then (provincias) =>  
            @provincias = provincias

    onSelect: (item) =>
      indice = @provinciasSeleccionadas.indexOf(item)
      encontrada = _.find( @anuncio.anunciosProvincia, (valor) -> valor.provinciaId is item.id )
      if encontrada == undefined  
        valor = new AnuncioProvincia( provinciaId: item.id,_destroy: "0")
        @anuncio.anunciosProvincia.push valor
      else
        encontrada._destroy = "0"

    onRemove:( item) =>
      encontrada = _.find( @anuncio.anunciosProvincia, (valor) -> valor.provinciaId is item.id )
      encontrada._destroy = "1"

    readFile: (file) =>
      if file
        @imagen = file
        fileRead = new FileReader()
        fileRead.onload = (e) => 
          @archivo =
            data: btoa( e.target.result )
            name: file.name
            type: file.type
        fileRead.readAsBinaryString(file)

    readVideo: (file) =>
      console.log file
      if file
        @video = file
        fileRead = new FileReader()
        fileRead.onload = (e) => 
          @archivo =
            data: btoa( e.target.result )
            name: file.name
            type: file.type
        fileRead.readAsBinaryString(file)


    guardar: =>
      esError = false
      if @anuncio.anunciosProvincia.length < 1 
        esError = true
      else 
        if @anuncio.anunciosProvincia.length < 2  && @anuncio.anunciosProvincia[0]._destroy == "1"
          esError = true

      if esError 
        toaster.pop({type: 'error', title: "Advertencia!!", body: 'Porfavor seleccione provincias'})
        return

      @anuncio.clienteId = @cliente.id
      @anuncio.archivo   = @archivo
      @anuncio.hora      = moment(@anuncio.hora).toDate()
      @anuncio.save().then () =>
        # console.log @anuncio.hora, "el dos"
        @anuncio.hora = moment(@anuncio.hora).toDate()
        toaster.pop({type: 'success', title: "Anuncio ", body: 'Guardado con exito'})
      , (e) =>
        texto = ""
        angular.forEach( e.data, (v,k) ->
          angular.forEach( v, (v2) ->
            texto += v2
          )
        )
        toaster.pop({type: 'error', title: "Anuncio ", body: texto})
])