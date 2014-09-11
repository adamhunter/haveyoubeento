HaveYouBeenTo.controller 'SearchController',
  class SearchController
    @$inject: ['$scope', 'Yelp', 'geoLocation', 'GoogleMaps']

    orderBy: ["-rating", "+name", "+address"]

    constructor: (@$scope, @Yelp, @geoLocation, @GoogleMaps, @Facebook) ->
      @search      = {}
      @restaurants = [name: 'bar', rating: '4.1']

      @$scope.$watch((=> geoLocation.city), (newValue) => 
        return unless newValue
        @search.location  = geoLocation.city
        @search.longitude = geoLocation.longitude
        @search.latitude  = geoLocation.latitude
      )

    query: ->
        return if !@search.location or !@search.query or @search.query.length < 3

        @yelps = @Yelp.query(search: @search)
        @yelps.$promise.then(=> angular.forEach(@yelps, (item) => @restaurants.push(item)))

        @gMaps = @GoogleMaps.query(search: @search)
        @gMaps.$promise.then(=> angular.forEach(@gMaps, (item) => @restaurants.push(item)))

