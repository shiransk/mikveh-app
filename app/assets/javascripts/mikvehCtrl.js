(function () {
  "use strict";
  angular.module("app").controller("mikvehCtrl", function($scope, $http) {

   
  $scope.setup = function () {
    $http.get("/api/v1/mikveh.json").then(function(response) {
    $scope.mikvehs = response.data;

    $scope.maps = function(){

    var locations = response.data

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 8,
      center: new google.maps.LatLng(37.4351753, -121.927035),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var infowindow = new google.maps.InfoWindow();

    var marker, i;

    for (i = 0; i < locations.length; i++) {  
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i].latitude, locations[i].longitude),
        map: map
      });

      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent(locations[i].name);
          infowindow.open(map, marker);
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