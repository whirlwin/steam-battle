main = angular.module 'main', []

main.controller 'mainController', ($scope) ->

  $scope.foo = ->
    console.log 'ouch'
