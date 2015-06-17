$(document).ready(function(){

// setting up the map, the map options and the starting position
  var mapCanvas = document.getElementById('map-canvas');
  
  var mapOptions = {
    center: new google.maps.LatLng(39.7392, -104.9903),
    zoom: 13,
    // scrollwheel: false,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  
  var map = new google.maps.Map(mapCanvas, mapOptions);

  // google.maps.event.addListener(map, 'click', function(e){
  //   alert('click');
  //   console.log(e);
  // })

//setting the map boundaries
  // var defaultBounds = new google.maps.LatLngBounds(
  //   new google.maps.LatLng(39.7392, -104.9903),
  //   new google.maps.LatLng(39.7392, -104.9903)
  // );

// //html input element for autocomplete search box
//   var input = document.getElementById('autocomplete');

// // Create the autocomplete object
//   // var autocomplete = new google.maps.places.Autocomplete(input);
//   autocomplete.bindTo(map);

//   var infoWindow = new google.maps.InfoWindow();
  
//   var bikeEventPosition = new google.maps.LatLng(39.7392, -104.9903)
  
//   function createImage(url){
//     var image = {
//       url: url,
//       // This marker is 32 pixels wide by 32 pixels tall.
//       size: new google.maps.Size(32, 32),
//       // The origin for this image is 0,0.
//       origin: new google.maps.Point(0,0),
//       // The anchor for this image is the base of the flagpole at 0,32.
//       anchor: new google.maps.Point(0, 32)
//   };
//     return image;
//   }

//   function createCustomMarker(bikeEventPosition,map){
//     marker = new google.maps.Marker({
//       position: bikeEventPosition,
//       map: map,
//       // draggable: true;
//       icon: createImage("/assets/bike.png")
//     });
//   }


//   google.maps.event.addListener(autocomplete, 'place_changed',function(){
//     infoWindow.close();
//     marker.setVisible(false);
//     var place = autocomplete.getPlace();
//     if (!place.geometry) {
//       window.alert( "Sorry, there are no places that meet your search");
//       return;
//     }

//     if (place.geometry.viewport) {
//       map.fitBounds(place.geometry.viewport);
//     } else {
//       map.setCenter(place.geometry.location);
//       map.setZoom(17);
//     }
//     marker.setIcon(({

//     }))

//   })

  // });
  });





// //marker on the map -- position and setting the marker
//   var markerOptions = {
//     position: new google.maps.LatLng(39.750444, -104.999489)
//   };

//   var marker = new google.maps.Marker(markerOptions);

//   marker.setMap(map)

// 






//pop up window
//   var infoWindowOptions = {
//     content: 'Blake Street Vault -- Drink here!'
//   };

//   var infoWindow = new google.maps.InfoWindow(infoWindowOptions);
  
//   google.maps.event.addListener(marker, 'click', function(e){
//     infoWindow.open(map, marker);
//   })

//   google.maps.event.addListener(autocomplete, 'place_changed', function(){
//     infoWindow.close();
//     var place = autocomplete.getPlace();
//     if (place.geometry.viewport) {
//       map.fitBounds(place.geometry.viewport);
//     } else {
//       map.setCenter(place.geometry.location);
//       map.setZoom(17);
//     }
    
//     marker.setPosition(place.geometry.location);
//     infoWindow.setContent('<div><strong>' + place.name + '</strong><br>');
//     infoWindow.open(map, marker);
//     google.maps.event.addListener(marker, 'click', function(e){

//       infoWindow.open(map, marker);

//     });