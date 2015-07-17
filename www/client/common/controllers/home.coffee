angular.module 'online-swiss-knife.common'
.controller 'home', ($scope, ImprovedUser) ->

  ImprovedUser.me()
  .$promise
  .then (res) ->
    $scope.user = res.currentUser

  $scope.logout = () ->
    ImprovedUser.logout()
    .$promise
    .then (res) ->
      console.log res
