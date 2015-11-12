angular.module("anuncioApp.anuncios").factory( "AnuncioService", ["Anuncio","Cliente",'Provincia', "toaster", (Anuncio, Cliente,Provincia, toaster) ->
  class AnuncioService 
    constructor: (id=undefined) ->
      if id 
        Anuncio.get(id).then (anuncio) =>
          # anuncio.hora = moment(anuncio.hora).format('HH:mm:ss')
          anuncio.hora =moment(anuncio.hora).utc().toDate()
          console.log anuncio.hora
          @anuncio = anuncio
          Cliente.query().then (clientes) =>
            @clientes = clientes
            @cliente  = _.find(@clientes, (item) -> item.id is anuncio.clienteId )          
      else
        @anuncio = new Anuncio
        Cliente.query().then (clientes) =>
          @clientes = clientes
          Provincia.query().then (provincias) =>
            @provincias = provincias
            # console.log @provincias


    guardar: =>
      @anuncio.clienteId = @cliente.id
      # @anuncio.hora = moment(@anuncio.hora).toDate()
      @anuncio.hora = moment(@anuncio.hora).toDate()
      console.log @anuncio.hora.toString, "akk"
      @anuncio.save().then () =>
        console.log @anuncio.hora, "el dos"
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