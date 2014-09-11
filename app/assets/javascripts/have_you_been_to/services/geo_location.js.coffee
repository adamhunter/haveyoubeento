HaveYouBeenTo.service 'geoLocation',
  class GeoLocation
    @$inject: ['$window', '$q']

    constructor: (@$window, $q) ->
      @deferred = $q.defer()
      @$promise = @deferred.promise
      @$window.navigator.geolocation.getCurrentPosition (geoposition) =>
        angular.extend @, geoposition.coords
        geocoder = new google.maps.Geocoder();
        latlng   = new google.maps.LatLng(@latitude, @longitude);
        geocoder.geocode latLng: latlng, (data) =>
          @city = data[0].address_components[3].long_name
          @deferred.resolve(@)

