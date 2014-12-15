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
    $scope.currencyRate = 1.39 # JPY/PV

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

    $scope.totalNumberOfPeople = (distributor) ->
      if distributor.children.length is 0 then distributor.number else distributor.number * (1 + $scope.totalNumberOfPeople(distributor.children[0]))
