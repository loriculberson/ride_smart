$(document).ready(function(){
  var mapCanvas = $('#map-canvas');
  
  var mapOptions = {
    zoom: 13,
    scrollwheel: false,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  var initialLocation;
  var denver = new google.maps.LatLng(39.7392, -104.9903)
  var map = new google.maps.Map(mapCanvas[0], mapOptions);
  var icons = {
    accident: {
      icon: "/assets/pin_blue-59fbfaf23f05a85bed3a692e9d73585bf2a506a7f4961c622ea2ccfffcb895a2.png"
    },
    hazard: {
      icon: "/assets/pin_green-b5719c0395d5ac7934f688f015b90117e67a3d5d77ca8aaaaf6dd364c332d0f9.png"
    },
    animal: {
      icon: "/assets/bike_marker2-dc5662f5d9e3ff27cab7bf20fd81ae614d96680f3a4f271dab10d63ecd61a9bb.png"
    }
  };


//W3C Geolocation preferred
  if(navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var initialLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
      
      map.setCenter(initialLocation);

      var youMarker = new google.maps.Marker({
      position: initialLocation, 
      map: map
    });

    }, function() {
      handleNoGeolocation(true);
    });
  } else {

  //if browser doesn't support Geolocation
    handleNoGeolocation(false);
  }

  function handleNoGeolocation(errorFlag) {
    if (errorFlag) {
      alert("Geolocation service failed");
      initialLocation = denver;
    } else {
      alert("Your browser doesn't support geolocation. We've placed you in Denver.");
      initialLocation = denver;
    }
    map.setCenter(initialLocation);
  }

//populating the map with markers FIRST
  // fetchAllMarkers(map);
  fetchAnimals(map);

  if ( window.hasOwnProperty('current_user') ) {
  // click on map and add a pin
    google.maps.event.addListener(map, 'click', function loggedInUser(event){
    function bindEvents() {
      var bikeEventForm = $(bikeInfoWindow.getContent());

      //if there are errors in the new bike event form 
      bikeEventForm.on('ajax:error', function(event, xhr) {
        var errorsDivContent = xhr.responseText;   //this is html
        initialBikeEventForm.find('.errors').html(errorsDivContent);
        bindEvents();
      })
      //successful creation of a marker, hit create action, 
      //then get the show view content = responseData

      bikeEventForm.on('ajax:success', function(event, responseData){
        var eventDetails = $(responseData);
        bikeInfoWindow.close();
        bikeInfoWindow.setContent(eventDetails[0]);
        //setContent doesn't know what to do with a jQuery object
        //eventDetails[0] is the first and only element in the array 
        //and since you need the entire element, use [0]

        var removeMarkerLink = eventDetails.find('.bye a')
        removeMarkerLink.on('click', function(event){
          event.preventDefault();

          $.ajax({
            type: 'DELETE',
            url: removeMarkerLink.attr('href')
          })
           marker.setMap(null);
        })
        bindEvents();
      })
    }

    var marker = new google.maps.Marker({
      position: event.latLng,
      map: map,
      draggable: true,
      animation: google.maps.Animation.DROP,
      // icon: "/assets/bike_marker2-dc5662f5d9e3ff27cab7bf20fd81ae614d96680f3a4f271dab10d63ecd61a9bb.png"
      icon: icons.accident.icon
      // icon: icons[event.event_kind].icon
    });

    var initialBikeEventForm = $($('#form-incident').html())

    var bikeInfoWindow = new google.maps.InfoWindow();

    //set the content of the infoWindow
    bikeInfoWindow.setContent(initialBikeEventForm[0]);
   
    bindEvents();

    google.maps.event.addListener(marker, 'click', function(){
      marker.draggable = false;
      // id for lat and long hidden fields, store marker position
      bikeInfoWindow.open(map, marker);
      //console.log($('#bike_event_latitude').val(marker.position.A));
      $('#bike_event_latitude').val(marker.position.A);
      $('#bike_event_longitude').val(marker.position.F);
    });
  });

  } else {
    google.maps.event.addListener(map, 'click', function loggedOutUserClick(event){
      if (confirm('Would you like to login?') ) {
        window.location = "/login";
      } else {
        alert("You must login to add a bike incident to the map.")
      }
    });
  }

  function addClickListenerToRemoveMarker(contentsOfInfoWindow, marker) {
    var removeMarkerLink = contentsOfInfoWindow.find('.bye a')
    removeMarkerLink.on('click', function(event){
      event.preventDefault();

      $.ajax({
        type: 'DELETE',
        url: removeMarkerLink.attr('href')
      })
      marker.setMap(null);
    })
  }

//getting marker data from the database
  function drawPins(map, data) {
    data.forEach(function(bikeEvent){
      var latLng = {lat: +bikeEvent.latitude, lng: +bikeEvent.longitude};
      console.log(bikeEvent);
      var marker = new google.maps.Marker({
        position: latLng,
        map: map,
        draggable: false,
        animation: google.maps.Animation.DROP,
        // icon: "/assets/pin_green-b5719c0395d5ac7934f688f015b90117e67a3d5d77ca8aaaaf6dd364c332d0f9.png",
        // icon: icons[bike_event.event_kind].icon,
        // icon: "",
        id: bikeEvent.id
      });

      //create infoWindow
      var twoWheeledEvent = $(bikeEvent.details)
      var markerInfoWindow = new google.maps.InfoWindow();
      markerInfoWindow.setContent(twoWheeledEvent[0]);

      addClickListenerToRemoveMarker(twoWheeledEvent, marker);      

      google.maps.event.addListener(marker, 'click', function(){
        markerInfoWindow.open(map, marker);
      });
    })
  }

  // Make an ajax call to get ACCIDENTS to '/bike_events'
  function fetchAccidents(map) {
    $.getJSON('/bike_events?event_kind=Accident', function(data) {
      drawPins(map, data);
    });
  }

  // Make an ajax call to get ACCIDENTS to '/bike_events'
  function fetchRoadHazards(map) {
    $.getJSON('/bike_events?event_kind=Road%20Hazard', function(data) {
      drawPins(map, data);
    });
  }

  function fetchAnimals(map) {
    $.getJSON('/bike_events?event_kind=Freak%2C%20wildlife%20incident', function(data) {
      drawPins(map, data);
    });
  }
  // Make an ajax get all '/bike_events'
  function fetchAllMarkers(map) {
    $.getJSON('/bike_events', function(data) {
      console.log(data);
      drawPins(map, data);
    });
  }
});

