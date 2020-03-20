function initMap() {
  if(!$("#map").length){
  }
  else {
    'use strict';

    var target = document.getElementById('map');
    var map;
    var point = {lat: gon.latitude, lng: gon.longitude};
    var name = gon.venue
    var marker;
    var infoWindow;

    map = new google.maps.Map(target, {
      center: point,
      zoom: 15
    });

    marker = new google.maps.Marker({
      position: point,
      map: map,
      animation: google.maps.Animation.DROP
    });

    infoWindow = new google.maps.InfoWindow({
      content: name
    });
    marker.addListener('click', function() { 
      infoWindow.open(map, marker); 
    });
  }
}