angular.module 'online-swiss-knife.user'
.config ($stateProvider) ->
  $stateProvider
      .state 'login',
        url: '/login'
        controller: 'login'
        templateUrl: 'user/views/login.html'
