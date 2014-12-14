'use strict'

describe 'Service: distributorFactory', ->

  # load the service's module
  beforeEach module 'amwatorApp'

  # instantiate service
  distributorFactory = {}
  distributor = undefined
  beforeEach inject (_distributorFactory_) ->
    distributorFactory = _distributorFactory_
    distributor = distributorFactory.createInstance()

  it 'should do something', ->
    expect(!!distributorFactory).toBe true

  it 'distributor', ->
    expect(distributor.calcGroupPv()).toBe 0

    distributor.setPv(500)
    expect(distributor.calcGroupPv()).toBe 500


  it 'distributor with child', ->
    child = distributorFactory.createInstance(500)
    expect(child.calcGroupPv()).toBe 500
    distributor.addChild(child, 10)

    expect(distributor).not.toBe(child)

    expect(distributor.calcGroupPv()).toBe 5000

