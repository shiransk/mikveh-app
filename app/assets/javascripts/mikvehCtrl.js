(function () {
  "use strict";
  angular.module("app").controller("mikvehCtrl", function($scope, $http) {

    $scope.maps = function(){
          var locations = [
      ['Am Echad', 37.2895373, -121.9127035],
      ['Coogee Beach', -33.923036, 151.259052, 5],
      ['Cronulla Beach', -34.028249, 151.157507, 3],
      ['Manly Beach', -33.80010128657071, 151.28747820854187, 2],
      ['Maroubra Beach', -33.950198, 151.259302, 1]
    ];

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 10,
      center: new google.maps.LatLng(-33.92, 151.25),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var infowindow = new google.maps.InfoWindow();

    var marker, i;

    for (i = 0; i < locations.length; i++) {  
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        map: map
      });

      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent(locations[i][0]);
          infowindow.open(map, marker);
        }
      })(marker, i));
    }
    }


   
  $scope.setup = function () {
    $http.get("/api/v1/mikveh.json").then(function(response) {
      $scope.mikvehs = response.data;
    });
    $scope.maps();
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