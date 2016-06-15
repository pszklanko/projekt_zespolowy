trainerApp
  .controller('trainerCtrl', function($scope,$http) {
    $scope.dupa = 'dupacycki';
	
	$scope.testScope = function() {
	  $http.get('getTestName.py').success(function(data) {
	 	console.log(data);
	    $scope.cipka = data[2];
	  });
	};

	$scope.testScope();
  });