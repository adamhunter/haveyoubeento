window.HaveYouBeenTo = angular.module('HaveYouBeenTo', ['ngRoute', 'ngResource', 'ui.utils'])

HaveYouBeenTo.config ['$httpProvider', ($httpProvider) ->
  $httpProvider.defaults.useXDomain = true
  delete $httpProvider.defaults.headers.common['X-Requested-With']
]
