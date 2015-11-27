angular.module("anuncioApp.pantallas").controller( "PantallaMostrarCtrl", [ "PantallaService","$location", ( PantallaService,$location ) -> 

  self = @
  pantallaLocal = JSON.parse(localStorage.getItem('provincia'));

  if !pantallaLocal
    $location.path('/pantallas');
    return

  console.log pantallaLocal
  @titulo = "Pantalla " + pantallaLocal.descripcion + " Provincia " + pantallaLocal.nombreProvincia + " ID " + pantallaLocal.provinciaId


  return
])