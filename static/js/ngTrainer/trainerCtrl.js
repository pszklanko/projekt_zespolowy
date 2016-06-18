trainerApp
  .controller('trainerCtrl', function($scope,$http) {
    $scope.diets = {};
    $scope.treningi = {};
    $scope.produkty = {};
    $scope.produkt = {'id_producenta': 1};
    $scope.rodzajeDiet = {};
    $scope.trainigTab = 'history';

    $scope.get = function(tableName, attr) {
      $http.post('getRecord.py', {'table': tableName,
                                 'attr': ''
        })
        .success( function(data) {
          console.log(data);
          if (tableName == 'diety') {
            $scope.diets = data;
          }
          else if (tableName == 'treningi') {
            $scope.trainings = data;
          }
          else if (tableName == 'produkty') {
            $scope.produkty = data;
          }
        })
        .error( function(data) {
          console.log(data);
        })
    };

    $scope.get('produkty', '');

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

    $scope.trainings = function(tab) {
      $scope.trainingTab = tab;
    };

  });
