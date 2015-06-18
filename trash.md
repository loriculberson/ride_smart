var bikeEventData = $('<div class="marker-info-win">' +
  '<div class="marker-inner-win"><span class="info-content">' +
  '<h2 class="marker-header"> New Marker </h2>'+
  'Reporting a bike incident' +
  '</span>' +
  '<br /><button name="remove-marker" class="remove-marker" title="'
  '</div></div>');

  // function fetchMarkers() {
//   $.ajax({ 
//     type:   'GET',
//     url:    '/bike_events.json',
//     success: function(bike_events){
//       $.each(bike_events, function(index, bike_event){
      // set all the markers to the map 
      // not movable, same data as when set the marker

//         }
//       })
//     }
//   })
// }