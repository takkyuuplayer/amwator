'use strict'

###*
 # @ngdoc function
 # @name amwatorApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the amwatorApp
###
angular.module('amwatorApp')
  .controller 'MainCtrl', ($scope, distributorFactory) ->
    $scope.currencyRate = 1.35 # JPY/PV

    $scope.me = distributorFactory.createInstance(0)
    $scope.children = []

    $scope.addChild = ->
      parent = if $scope.children.length > 0 then _.last($scope.children) else $scope.me

      child = distributorFactory.createInstance(0)
      $scope.children.push child
      parent.addChild(child)

    $scope.removeChild = ->
      return if $scope.children.length is 0

      $scope.children.pop()
      parent = if $scope.children.length > 0 then _.last($scope.children) else $scope.me
      parent.clearChild()
