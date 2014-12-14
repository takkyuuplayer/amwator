'use strict'

###*
 # @ngdoc service
 # @name amwatorApp.amuwatorUtil
 # @description
 # # amuwatorUtil
 # Factory in the amwatorApp.
###
angular.module('amwatorApp')
  .factory 'amuwatorUtil', ->

    # Public API here
    {
      getCashbackRate: (pv) ->
        switch
          when pv < 30000   then 0
          when pv < 90000   then 3
          when pv < 180000  then 6
          when pv < 360000  then 9
          when pv < 600000  then 12
          when pv < 1000000 then 15
          when pv < 1500000 then 18
          else 21
    }
