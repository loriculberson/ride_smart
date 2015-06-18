$(document).ready(function(){
// setting up the map, the map options and the starting position
  var mapCanvas = document.getElementById('map-canvas');
  
  var mapOptions = {
    center: new google.maps.LatLng(39.7392, -104.9903),
    zoom: 13,
    scrollwheel: false,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  
  var map = new google.maps.Map(mapCanvas, mapOptions);
  
   google.maps.event.addListener(map, 'click', function(event){
    alert('Drag marker to site of bike incident');
       var marker = new google.maps.Marker({
        position: event.latLng,
        map: map,
        draggable: true,
        animation: google.maps.Animation.DROP,
        icon: '/assets/bike_marker2.png'
    });

    // var bikeEventData = $($('#form-incident').html())

    var bikeInfoWindow = new google.maps.InfoWindow();

    //set the content of the infoWindow
    // bikeInfoWindow.setContent(bikeEventData[0]);

    // google.maps.event.addListener(marker, 'click', function(){
    //   bikeInfoWindow.open(map, marker);
    // });
     
//current user can remove their own markers
    var removeMarker = bikeEventData.find('.remove')[0];
    google.maps.event.addDomListener(removeMarker, 'click', function(event) {
      marker.setMap(null);
    })

  });

});
