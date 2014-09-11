HaveYouBeenTo.service 'geoLocation',
  class GeoLocation
    @$inject: ['$http']

    constructor: (@$http) ->
      @request = @$http.get("http://freegeoip.net/json/")
      @request.then (response) => angular.extend @, response.data

    locate: (fn) ->
      @request.then fn

