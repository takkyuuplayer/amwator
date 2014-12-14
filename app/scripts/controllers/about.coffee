'use strict'

###*
 # @ngdoc function
 # @name amwatorApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the amwatorApp
###
angular.module('amwatorApp')
  .controller 'AboutCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
