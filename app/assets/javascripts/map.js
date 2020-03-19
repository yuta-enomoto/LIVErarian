function initMap() {
  'use strict';

  var target = document.getElementById('map');
  var map;
  var geocoder = new google.maps.Geocoder();



  if (window.location.href.match(/\/posts\/\d+\/show_post/)){
    geocoder.geocode({
      address: gon.address
    }, function(results, status) {
      if (status !== 'OK') {
        alert('Failed: ' + status);
        return;
      }

  
      if (results[0]) {
        new google.maps.Map(target, {
          center: results[0].geometry.location,
          zoom: 15
        });
        // new google.maps.Marker(target,{
        //   position: results[0].geometry.location,
        //   map: map,
        //   title: 'Tokyo!',
        //   animation: google.maps.Animation.DROP
        // });
      } else {
        alert('No results found');
        return;
      }
    });
  };


  // map = new google.maps.Map(target, {
  //   center: tokyo,
  //   zoom: 15
  // });
}