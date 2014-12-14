'use strict'

###*
 # @ngdoc service
 # @name amwatorApp.distributorFactory
 # @description
 # # distributorFactory
 # Factory in the amwatorApp.
###
angular.module('amwatorApp')
  .factory 'distributorFactory', ['amuwatorUtil', (amuwatorUtil) ->
    # Service logic
    # ...

    class Distributor
      constructor: (pv = 0) ->
        @pv = pv
        @number = 1
        @children = []
      addChild: (distributor) ->
        @children.push distributor
      clearChild: ->
        @children = []
      setPv: (pv) ->
        @pv = pv
      getPv: ->
        @pv
      calcGroupPv: ->
        parseInt(@pv) + _.reduce @children, (memo, distributor) ->
          memo + distributor.calcGroupPv() * distributor.number
        , 0
      calcCashback: ->
        groupPv = @calcGroupPv()
        groupPv * amuwatorUtil.getCashbackRate(groupPv) / 100

      calcIncentive: ->
        @calcCashback() - _.reduce @children, (memo, distributor) ->
          memo + distributor.calcCashback() * distributor.number
        , 0

    # Public API here
    {
      createInstance: (pv = 0) ->
        new Distributor(pv)
    }
    ]
