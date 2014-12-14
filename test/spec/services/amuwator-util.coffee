'use strict'

describe 'Service: amuwatorUtil', ->

  # load the service's module
  beforeEach module 'amwatorApp'

  # instantiate service
  amuwatorUtil = {}
  beforeEach inject (_amuwatorUtil_) ->
    amuwatorUtil = _amuwatorUtil_

  it 'getCashbackRate', ->
    expect(!!amuwatorUtil).toBe true

  it 'getCashbackRate', ->
    expect(amuwatorUtil.getCashbackRate(0)).toBe 0
    expect(amuwatorUtil.getCashbackRate(29999)).toBe 0
    expect(amuwatorUtil.getCashbackRate(30000)).toBe 3
    expect(amuwatorUtil.getCashbackRate(89999)).toBe 3
    expect(amuwatorUtil.getCashbackRate(90000)).toBe 6
    expect(amuwatorUtil.getCashbackRate(179999)).toBe 6
    expect(amuwatorUtil.getCashbackRate(180000)).toBe 9
    expect(amuwatorUtil.getCashbackRate(359999)).toBe 9
    expect(amuwatorUtil.getCashbackRate(360000)).toBe 12
    expect(amuwatorUtil.getCashbackRate(599999)).toBe 12
    expect(amuwatorUtil.getCashbackRate(600000)).toBe 15
    expect(amuwatorUtil.getCashbackRate(999999)).toBe 15
    expect(amuwatorUtil.getCashbackRate(1000000)).toBe 18
    expect(amuwatorUtil.getCashbackRate(1499999)).toBe 18
    expect(amuwatorUtil.getCashbackRate(1500000)).toBe 21
