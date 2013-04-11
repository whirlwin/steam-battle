main = angular.module 'main', []

main.controller 'mainController', ($scope, $http) ->

  $scope.getSteamFriends = ->

    $http({ url: "steamFriends?steamID=#{$scope.steamID}", method: 'GET' }

    ).success((friends) ->
      $scope.friends = friends

    ).error (data) ->
      console.log data
