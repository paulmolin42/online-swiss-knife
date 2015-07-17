angular.module 'online-swiss-knife.common'
.config ($stateProvider) ->
  $stateProvider
  .state 'home',
    url: '/'
    controller: 'home'
    templateUrl: 'common/views/home.html'
