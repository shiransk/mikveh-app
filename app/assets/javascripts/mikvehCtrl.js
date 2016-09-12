(function () {
  "use strict";
  angular.module("app").controller("mikvehCtrl", function($scope, $http, NgMap) {

  NgMap.getMap().then(function(map) {
        function setMarker(map, position, title, content) {
          var marker;
          var markerOptions = {
              position: position,
              map: map,
              title: title,
              icon: 'https://maps.google.com/mapfiles/ms/icons/green-dot.png'
          };

          marker = new google.maps.Marker(markerOptions);
          markers.push(marker); // add marker to array
          
          google.maps.event.addListener(marker, 'click', function () {
              // close window if not undefined
              if (infoWindow !== void 0) {
                  infoWindow.close();
              }
              // create new window
              var infoWindowOptions = {
                  content: content
              };
              infoWindow = new google.maps.InfoWindow(infoWindowOptions);
              infoWindow.open(map, marker);
          });
        } 

    // show the map and place some markers
    initMap();

    setMarker(map, new google.maps.LatLng(51.508515, -0.125487), 'London', 'Just some content');
    setMarker(map, new google.maps.LatLng(52.370216, 4.895168), 'Amsterdam', 'More content');
    setMarker(map, new google.maps.LatLng(48.856614, 2.352222), 'Paris', 'Text here');

  });
   
  $scope.setup = function () {
    $http.get("/api/v1/mikveh.json").then(function(response) {
      $scope.mikvehs = response.data;
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



// app.controller('MyController', function(NgMap) {
//   NgMap.getMap().then(function(map) {
//     console.log(map.getCenter());
//     console.log('markers', map.markers);
//     console.log('shapes', map.shapes);
//   });
// });










  window.$scope = $scope;

  });
}());