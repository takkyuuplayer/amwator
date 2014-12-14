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
        @children = []
      addChild: (distributor, number = 1) ->
        @children.push {
          distributor: distributor
          number: number
        }
      clearChild: ->
        @children = []
      setPv: (pv) ->
        @pv = pv
      getPv: ->
        @pv
      calcGroupPv: ->
        @pv + _.reduce @children, (memo, child) ->
          memo + child.distributor.calcGroupPv() * child.number
        , 0
      calcCashback: ->
        groupPv = @calcGroupPv()
        groupPv * amuwatorUtil.getCashbackRate(groupPv) / 100

      calcIncentive: ->
        @calcCashback() - _.reduce @children, (memo, child) ->
          memo + child.distributor.calcCashback() * child.number
        , 0

    # Public API here
    {
      createInstance: (pv = 0) ->
        new Distributor(pv)
    }
    ]
