'use strict'

describe 'Service: distributorFactory', ->

  # load the service's module
  beforeEach module 'amwatorApp'

  # instantiate service
  distributorFactory = {}
  distributor = undefined
  util = {}
  beforeEach inject (_distributorFactory_, _amuwatorUtil_) ->
    distributorFactory = _distributorFactory_
    distributor = distributorFactory.createInstance()
    util = _amuwatorUtil_

  it 'should do something', ->
    expect(!!distributorFactory).toBe true

  it 'distributor', ->
    expect(distributor.calcGroupPv()).toBe 0

    distributor.setPv(500)
    expect(distributor.calcGroupPv()).toBe 500


  it 'distributor with child', ->
    child = distributorFactory.createInstance(500)
    expect(child.calcGroupPv()).toBe 500

    child.number = 10
    distributor.addChild(child)

    expect(distributor.calcGroupPv()).toBe 5000

  it 'calcCashback', ->
    expect(distributor.calcCashback()).toBe 0

    distributor.setPv(30000)
    expect(distributor.calcCashback()).toBe 30000 * 3 / 100

    child = distributorFactory.createInstance(6000)
    child.number = 10
    distributor.addChild(child)

    expect(distributor.calcCashback()).toBe 90000 * 6 / 100

  it 'calcIncentive', ->
    expect(distributor.calcIncentive()).toBe 0

    distributor.setPv(30000)
    expect(distributor.calcIncentive()).toBe 30000 * 3 / 100

    child = distributorFactory.createInstance(6000)
    child.number = 10
    distributor.addChild(child)

    expect(distributor.calcIncentive()).toBe 90000 * 6 / 100

    child = distributorFactory.createInstance(30000)
    child.number = 10
    distributor.addChild(child)

    expect(distributor.calcIncentive()).toBe(390000 * 12 / 100 - 30000 * 3 / 100 * 10)
