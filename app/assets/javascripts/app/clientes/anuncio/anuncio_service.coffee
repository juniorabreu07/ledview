angular.module("anuncioApp.anuncios").factory( "AnuncioService", [ "$http", "Anuncio", "AnuncioProvincia",'Provincia', "toaster", "Upload", ($http, Anuncio, AnuncioProvincia,Provincia, toaster, Upload) ->
  class AnuncioService 
    constructor: (id=undefined) ->
      @provinciasSeleccionadas = []
      @archivo                 = undefined
      @imagen                  = undefined
      @startDate               = moment(new Date).subtract(1, 'days').toDate()
      @startDate               = moment(@startDate).format("DD/MM/YYYY")
      @hora                    = moment().toDate()
      @horaTemp                = moment().toDate()
      this.items               = ['Texto', 'Imagen', 'Video']
      if id 
        Anuncio.get(id).then (anuncio) =>
          @hora             = moment(anuncio.hora).utc("+0004").toDate()
          @horaTemp         = @hora
          @anuncio          = anuncio
          @anuncio.fechaEnd = moment(@anuncio.fechaEnd).format("DD/MM/YYYY")
          @imagen           = anuncio.cfile.cfile.image320x240.url if anuncio.tipo == 'Imagen'
          @video            = anuncio.video.video.url if anuncio.tipo == 'Video'
          Provincia.query().then (provincias) =>  
            @provincias  = provincias
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
      esError = true
      if @anuncio.anunciosProvincia.length < 1
        esError = false
      if esError
        for index in [0..@anuncio.anunciosProvincia.length] when index < @anuncio.anunciosProvincia.length
          if @anuncio.anunciosProvincia[index]._destroy == "0" || @anuncio.anunciosProvincia[index]._destroy == undefined
            esError = true
            break
          else 
            esError = false

      if !esError 
        toaster.pop({type: 'error', title: "Advertencia!!", body: 'Porfavor seleccione provincias'})
        return

      @anuncio.archivo   = @archivo
      if (@hora != @horaTemp)
        @anuncio.hora      = moment.utc(@hora).utcOffset("-0400").format('YYYY-MM-DD HH:mm:ss')
      @anuncio.save().then () =>
        console.log @anuncio.hora
        if (@hora != @horaTemp)
          @hora = moment(@anuncio.hora).utc("+0004").toDate()
        @anuncio.fechaEnd = moment(@anuncio.fechaEnd).format("DD/MM/YYYY")
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