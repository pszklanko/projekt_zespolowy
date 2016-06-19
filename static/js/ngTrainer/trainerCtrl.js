trainerApp
  .controller('trainerCtrl', function($scope,$http) {
    $scope.diety = {};
    $scope.treningi = {};
    $scope.produkty = {};
    $scope.produkt = {};
    $scope.rodzajeDiet = {};
    $scope.producenci = {};
    $scope.newTraining = {};
    $scope.trainingHistory = {};
    $scope.cwiczenia = {};
    $scope.noweDiety = [];
    $scope.trainigTab = 'history';
    $scope.rodzajeDiet = {};
    $scope.uzytkownicy = [];
    $scope.uzytkownik = {};
    $scope.trening = {};
    $scope.isLogged = false;
    $scope.userId = 0;
    $scope.successfulOperation = false;

    $scope.sortType     = 'name';
    $scope.sortReverse  = false;

    $scope.get = function(tableName, attr) {
      $successfulOperation = false;
      $http.post('getRecord.py', {'table': tableName,
                                  'attr': attr})
        .success( function(data) {
          if (tableName == 'diety') {
            $scope.diety = data;
          }
          else if (tableName == 'treningi') {
            $scope.treningi = data;
          }
          else if (tableName == 'produkty') {
            $scope.produkty = data;
          }
          else if (tableName == 'producent') {
            $scope.producenci = data;
          }
          else if (tableName == 'historia treningow') {
            $scope.trainingHistory = data;
          }
          else if (tableName == 'cwiczenia') {
            $scope.cwiczenia = data;
          }
          else if (tableName == 'rodzaje_diet') {
            $scope.rodzajeDiet = data;
          }
          else if (tableName == 'uzytkownicy') {
            $scope.uzytkownicy = data;
          }
        })
        .error( function(data) {
          console.log(data);
        })
    };

    $scope.get('produkty', '');
    $scope.get('uzytkownicy', '');

    $scope.add = function(tableName, attr) {
      $http.put('addRecord.py', {'table': tableName,
                                   'attr': attr
        })
        .success( function () {
          $scope.successfulOperation = true;
          console.log('operacja powiodła się');
        })
        .error( function (data) {
          console.log(data);
        })
    };

    $scope.trainings = function(tab) {
      $scope.trainingTab = tab;
    };

    $scope.isRegistered = function(uzytkownik) {
      $scope.uzytkownicy.length;
      for (var i = 0; i < $scope.uzytkownicy.length; i++) {
        if ($scope.uzytkownicy[i].login == uzytkownik['login']) {
          if($scope.uzytkownicy[i].haslo == uzytkownik['haslo']) {
            $scope.isLogged = true;
            $scope.userId = $scope.uzytkownicy[i].id
          }
        }
      }
      if (!$scope.isLogged) {
        console.log('nie udalo sie zalogowac');
      }
    }

    $scope.register = function (uzytkownik) {
      if (uzytkownik.haslo == uzytkownik.powHaslo) {
        delete uzytkownik.powHaslo;
        $scope.add('uzytkownicy', uzytkownik);
      }
      else {
        console.log('nie udało się zarejestrować');
        $scope.uzytkownik = {};
      }
    }


    $scope.products = [""];
    $scope.addProduct = function() {
      $scope.products.push('');
    };

    $scope.removeProduct = function() {
      var lastItem = $scope.products.length-1;
      $scope.products.splice(lastItem, 1);
    };

    $scope.addProducts = function(products, id_rodzaj_diety) {
      for (var i = 0; i < products.length; i++) {
        $scope.add('diety',{
                            'id_uzytkownika': $scope.userId,
                            'id_produktu': products[i],
                            'id_rodzaj_diety': id_rodzaj_diety
        })
      }
      $scope.products = [""];
    };


    $scope.exercises = [""];
    $scope.addExercise = function() {
      $scope.exercises.push('');
    };

    $scope.removeExercise = function() {
      var lastItem = $scope.exercises.length-1;
      $scope.exercises.splice(lastItem, 1);
    };

    $scope.addExercises = function(exercises, id_dnia) {
      id_dnia = id_dnia.getDay();
      if (id_dnia == 0) {
        id_dnia = 7;
      }
      for (var i = 0; i < exercises.length; i++) {
        $scope.add('treningi',{
                            'id_uzytkownika': $scope.userId,
                            'id_cwiczenia': exercises[i],
                            'id_dnia': id_dnia
        })
      }
      $scope.exercises = [""];
    };

    $scope.addTraining = function (training) {
      delete training.id_dnia;
      day = training.data_dodania.getDate() < 10 ? '0'+training.data_dodania.getDate() : training.data_dodania.getDate();
      month = training.data_dodania.getMonth() < 10 ? '0'+(training.data_dodania.getMonth()+1) : training.data_dodania.getMonth()+1;
      year = training.data_dodania.getFullYear();
      training.data_dodania = year+'-'+month+'-'+day;
      training['id_uzytkownika'] = $scope.userId;
      if (training['czy_trening_wykonany']) {
        training['czy_trening_wykonany'] = '1';
      }
      else {
        training['czy_trening_wykonany'] = '0';
      }
      $scope.add('historia_treningow', training);
    }

  });
