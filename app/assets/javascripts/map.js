function initMap() {
  if(!$("#map").length){
  }

  else {
    if (window.location.href.match(/\/searches/)){
      $('#map').css("height", "580px")
      'use strict';
      
      var target = document.getElementById('map');


      if (!navigator.geolocation) {
        alert('Geolocation not supported');
        return;
      }

      navigator.geolocation.getCurrentPosition(function(position) {
        new google.maps.Map(target, {
          center: {
            lat: position.coords.latitude,
            lng: position.coords.longitude
          },
          zoom: 15
        });
      }, function() {
        alert('Geolocation failed!');
        return;
      });
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
}