'use strict'

###*
 # @ngdoc overview
 # @name amwatorApp
 # @description
 # # amwatorApp
 #
 # Main module of the application.
###
angular
  .module('amwatorApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch'
  ])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/'

