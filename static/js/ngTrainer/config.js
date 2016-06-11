trainerApp
  .config( function ($routeProvider) {
    $routeProvider.when("/diets", {
      templateUrl: "diets.html"
    });
    $routeProvider.when("/products", {
      templateUrl: "products.html"
    });
    $routeProvider.when("/trainings", {
      templateUrl: "trainings.html"
    });
    $routeProvider.otherwise({
      templateUrl: "main.html"
    });
  });
