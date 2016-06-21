function drawLegend(map, icons) {
 var legend = document.getElementById('legend');

  map.controls[google.maps.ControlPosition.LEFT_BOTTOM].push(
    document.getElementById('legend'));

  var icon_types = new Array();
  var icon_urls = new Array();
  var legend_text = 'LEGEND' + '<br>';

  for (var icon in icons) {
    icon_types.push(icon);
    icon_urls.push(icons[icon].url);
  }

  for (var i = 0, j = icon_types.length; i<j; i++) {
    var div = document.createElement('div');
    legend_text += '<img src="' + icon_urls[i] + '"> ' + icon_types[i] + "<br>";
    div.innerHTML = legend_text;
  }
    document.getElementById("legend").innerHTML = legend_text;
 }