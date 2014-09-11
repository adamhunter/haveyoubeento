HaveYouBeenTo.controller 'SearchController',
  class SearchController
    @$inject: ['$scope', 'Yelp', 'geoLocation', 'GoogleMaps']

    orderBy: ["-rating", "+name", "+address"]

    constructor: (@$scope, @Yelp, @geoLocation, @GoogleMaps, @Facebook) ->
      @search      = {}
      @restaurants = [@chickapeas()]

      @geoLocation.$promise.then (location) =>
        @search.location  = @geoLocation.city
        @search.longitude = @geoLocation.longitude
        @search.latitude  = @geoLocation.latitude

    query: ->
        return if !@search.location or !@search.query or @search.query.length < 3
        @restaurants.length = 0

        @yelps = @Yelp.query(search: @search)
        @yelps.$promise.then(=> angular.forEach(@yelps, (item) => @restaurants.push(item)))

        @gMaps = @GoogleMaps.query(search: @search)
        @gMaps.$promise.then(=> angular.forEach(@gMaps, (item) => @restaurants.push(item)))

    chickapeas: ->
      name:    "Chickapea's Place"
      rating:  '5.1'
      address: 'Independence Highway'
      source:  HaveYouBeenTo.Sources.have_you_been_to

