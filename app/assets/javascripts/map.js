function initMap() {
  'use strict';

  var target = document.getElementById('map');
  var map;
  var tokyo = {lat: 35.681167, lng: 139.767052};
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