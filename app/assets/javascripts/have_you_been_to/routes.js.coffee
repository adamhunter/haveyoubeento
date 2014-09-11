HaveYouBeenTo.config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
  $routeProvider
    .when('/',
      templateUrl: HaveYouBeenTo.templates.search,
      controller: 'SearchController as ctrl'
    )
]
