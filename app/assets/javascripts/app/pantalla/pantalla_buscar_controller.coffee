angular.module("anuncioApp.pantallas").controller( "PantallaBuscarCtrl", [ "$routeParams","$http", "Pantalla", ($routeParams,$http, Pantalla) -> 

  self = @

  codigo = $routeParams.codigo
  	
  if codigo
  	$http.get('/api/pantallas.json?codigo='+codigo).success (data) ->
		  console.log  data
	  return
	  
  	# Pantalla.get(codigo).then (pantalla) =>
   #    @pantalla = pantalla
   #    console.log pantalla

  return
])