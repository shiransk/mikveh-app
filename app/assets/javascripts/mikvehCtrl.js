(function () {
  "use strict";
  angular.module("app").controller("mikvehCtrl", function($scope, $http) {

   
  $scope.setup = function () {
    $http.get("/api/v1/mikveh.json").then(function(response) {
    $scope.mikvehs = response.data;

    $scope.maps = function() {

    var locations = response.data

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 8,
      center: new google.maps.LatLng(38.7749295, -123.21941550000001),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var infowindow = new google.maps.InfoWindow();
    var infoWindow = new google.maps.InfoWindow();

    // Try HTML5 geolocation.
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        var pos = {
          lat: position.coords.latitude,
          lng: position.coords.longitude
        };

        infoWindow.setPosition(pos);
        infoWindow.setContent('Location found.');
        map.setCenter(pos);
      }, function() {
        handleLocationError(true, infoWindow, map.getCenter());
      });
      console.log("it worked");
    } else {
      // Browser doesn't support Geolocation
      handleLocationError(false, infoWindow, map.getCenter());
      console.log("didnt worked");
    }

  function handleLocationError(browserHasGeolocation, infoWindow, pos) {
    infoWindow.setPosition(pos);
    infoWindow.setContent(browserHasGeolocation ?
                          'Error: The Geolocation service failed.' :
                          'Error: Your browser doesn\'t support geolocation.');
  }

          //   if (navigator.geolocation) {
          // navigator.geolocation.getCurrentPosition(function(position) {
          //   var pos = {
          //     lat: position.coords.latitude,
          //     lng: position.coords.longitude
          //   };

        //     infoWindow.setPosition(pos);
        //     infoWindow.setContent('Location found.');
        //     map.setCenter(pos);
        //   }, function() {
        //     handleLocationError(true, infoWindow, map.getCenter());
        //   });
        // } else {
        //   // Browser doesn't support Geolocation
        //   handleLocationError(false, infoWindow, map.getCenter());
        // }
      

    var marker, i;

    for (i = 0; i < locations.length; i++) {  
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i].latitude, locations[i].longitude),
        map: map
      });

      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent("<a href='/mikvehs/" + locations[i].id + "''>" + locations[i].name + "</a>");
          infowindow.open(map, marker);
          // window.location.href = locations[i].name
        }
      })(marker, i));
    }
    }

    $scope.maps();
    });
  }

  $scope.selectedItemChanged = function(mikvehs) {
    console.log(mikvehs);
  }

  $scope.sortByAttr = function(attr) {
    if (attr == $scope.orderAttr) {
      $scope.desc = !$scope.desc;
    }
      else {   
      $scope.orderAttr = attr;
    }
  }


  window.$scope = $scope;

  });
}());