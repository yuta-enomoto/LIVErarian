function initMap() {
  'use strict';

  var target = document.getElementById('map');
  var map;
  var tokyo = {lat: gon.latitude, lng: gon.longitude};
  var marker;

  map = new google.maps.Map(target, {
    center: tokyo,
    zoom: 15
  });

  marker = new google.maps.Marker({
    position: tokyo,
    map: map,
    title: 'Tokyo!',
    animation: google.maps.Animation.DROP
  });
}