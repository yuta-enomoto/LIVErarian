function initMap() {
  if(!$("#map").length){
  }
  else {
    'use strict';

    var target = document.getElementById('map');
    var map;
    var point = {lat: gon.latitude, lng: gon.longitude};
    var marker;

    map = new google.maps.Map(target, {
      center: point,
      zoom: 15
    });

    marker = new google.maps.Marker({
      position: point,
      map: map,
      // title: 'Tokyo!',
      animation: google.maps.Animation.DROP
    });
  }
}