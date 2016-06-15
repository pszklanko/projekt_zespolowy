trainerApp
  .controller('trainerCtrl', function($scope,$http) {
    $scope.diets = {};
    $scope.treningi = {};
    $scope.produkt = {};

    $scope.get = function(tableName, attr) {
      $http.post('getRecord.py', {'table': tableName,
                                 'attr': attr
        })
        .success( function(data) {
          if (tableName == 'diety') {
            $scope.diets = data;
          }
          else if (tableName == 'treningi') {
            $scope.trainings = data;
          }
        })
        .error( function(data) {
          console.log(data);
        })
    };

    $scope.add = function(tableName, attr) {
      $http.put('addRecord.py', {'table': tableName,
                                   'attr': attr
        })
        .success( function () {
          console.log('dodano produkt');
        })
        .error( function (data) {
          console.log(data);
        })
    };
  });
