angular.module 'online-swiss-knife.user'
.controller 'login', ($scope, ImprovedUser) ->

  $scope.login = ->
    ImprovedUser.login
      email: $scope.loginEmail
      password: $scope.loginPassword

  $scope.createUser = ->
    ImprovedUser.create
      email: $scope.createEmail
      password: $scope.createPassword
