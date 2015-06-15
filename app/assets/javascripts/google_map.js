$(document).ready(function(){

//setting up the map, the map options and the starting position
  var mapCanvas = document.getElementById('map-canvas');
  
  var mapOptions = {
    center: new google.maps.LatLng(39.7392, -104.9903),
    zoom: 13,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  
  var map = new google.maps.Map(mapCanvas, mapOptions);

//marker on the map -- position and setting the marker
  var markerOptions = {
    position: new google.maps.LatLng(39.750444, -104.999489)
  };

  var marker = new google.maps.Marker(markerOptions);
  marker.setMap(map)

//pop up window
  var infoWindowOptions = {
    content: 'Blake Street Vault -- Drink here!'
  };

  var infoWindow = new google.maps.InfoWindow(infoWindowOptions);
  google.maps.event.addListener(marker, 'click', function(e){
    infoWindow.open(map, marker);
  })

//autocomplete box and content
  var acOptions = {
    types: ['establishment']
  };

  var autocomplete = new google.maps.places.Autocomplete(document.getElementById('autocomplete'),acOptions);
  autocomplete.bindTo('bounds',map);

  google.maps.event.addListener(autocomplete, 'place_changed', function(){
    infoWindow.close();
    var place = autocomplete.getPlace();
    if (place.geometry.viewport) {
      map.fitBounds(place.geometry.viewport);
    } else {
      map.setCenter(place.geometry.location);
      map.setZoom(17);
    }
    marker.setPosition(place.geometry.location);
    infoWindow.setContent('<div><strong>' + place.name + '</strong><br>');
    infoWindow.open(map, marker);
    google.maps.event.addListener(marker, 'click', function(e){

      infoWindow.open(map, marker);

    });




});