HaveYouBeenTo.factory 'GoogleMaps', ['$q', ($q) ->
  class GoogleMaps
    @map:     new google.maps.Map(angular.element('<div>')[0])
    @service: new google.maps.places.PlacesService(@map)

    @query: (search) ->
      new @(search).search()

    constructor: ({search: {@query, @location, @latitude, @longitude}}) ->
      @results = []

    search: ->
      deffered = $q.defer()

      @constructor.service.textSearch query: @textQuery(), center: @center(), (results) => 
        @results.length   = 0
        angular.forEach(results, (item) => 
          @results.push(
            name: item.name
            url:  ''
            address: item.formatted_address
            rating: "#{item.rating or 0}"
            source: HaveYouBeenTo.Sources.google_maps
            id:     item.place_id
          )
        )
        deffered.resolve(@results)

      @results.$promise = deffered.promise
      @results

    textQuery: ->
      "#{@query} in #{@location}"

    center: ->
      new google.maps.LatLng(@latitude, @longitude)
]
