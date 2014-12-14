'use strict'

###*
 # @ngdoc function
 # @name amwatorApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the amwatorApp
###
angular.module('amwatorApp')
  .controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
