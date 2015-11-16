angular.module("anuncioApp.anuncios").factory( "AnuncioService", ["Anuncio", "AnuncioProvincia", "Cliente",'Provincia', "toaster", (Anuncio, AnuncioProvincia, Cliente,Provincia, toaster) ->
  class AnuncioService 
    constructor: (id=undefined) ->
      @provinciasSeleccionadas = []
      this.items = ['Texto', 'Imagen', 'Video']
      if id 
        Anuncio.get(id).then (anuncio) =>
          anuncio.hora = moment(anuncio.hora).utc().toDate()        
          @anuncio = anuncio
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
        @anuncio = new Anuncio
        @anuncio.tipo = "Texto"
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
        indice = @anuncio.anunciosProvincia.indexOf(encontrada)
        @anuncio.anunciosProvincia.splice(indice,1)
        valor = new AnuncioProvincia( provinciaId: item.id,_destroy: "0",id: encontrada.id)
        @anuncio.anunciosProvincia.push valor

    onRemove:( item) =>
      encontrada = _.find( @anuncio.anunciosProvincia, (valor) -> valor.provinciaId is item.id )
      indice = @anuncio.anunciosProvincia.indexOf(encontrada)
      @anuncio.anunciosProvincia.splice(indice,1)
      valor = new AnuncioProvincia( provinciaId: item.id,_destroy: "1",id: encontrada.id)
      @anuncio.anunciosProvincia.push valor

    guardar: =>
      if @anuncio.anunciosProvincia.length < 1
        toaster.pop({type: 'error', title: "Advertencia!!", body: 'Porfavor seleccione provincias'})
        return 
      @anuncio.clienteId = @cliente.id
      # console.log @anuncio.cfile,"file"
      @anuncio.hora = moment(@anuncio.hora).toDate()
     
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

    time: (time)=>
      now     = new Date() 
      year    = now.getFullYear()
      month   = now.getMonth()+1
      day     = now.getDate()
      hour    = now.getHours()
      minute  = now.getMinutes()
      second  = now.getSeconds()

      if month.toString().length == 1 
        month = '0'+month

      if day.toString().length == 1
        day = '0'+day

      if hour.toString().length == 1 
        hour = '0'+hour

      if minute.toString().length == 1 
        minute = '0'+minute

      if second.toString().length == 1 
        second = '0'+second

      time = hour+':'+minute+':'+second
])