angular.module('anuncioApp').factory('interceptorsNoAccess', ['$q', 'toaster', ($q, toaster) ->
  service = {}

  service.responseError = (response) ->
    m = $q.defer()
    if response.status is 403
      toaster.pop("error", "Acción", "No tiene acceso para esta acción")
    $q.reject(response)

  return service
])

angular.module('anuncioApp').config(['$httpProvider', ($httpProvider) -> 
     $httpProvider.interceptors.push('interceptorsNoAccess')
])