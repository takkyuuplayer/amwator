'use strict'

describe 'Controller: MainCtrl', ->

  # load the controller's module
  beforeEach module 'amwatorApp'

  MainCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    MainCtrl = $controller 'MainCtrl', {
      $scope: scope
    }

  it 'bount values', ->
    expect(scope.currencyRate).toBe(1.39)
    expect(scope.me).toBeDefined()
    expect(scope.children).toEqual([])
    expect(scope.addChild).toBeDefined()
    expect(scope.removeChild).toBeDefined()

  it 'addChild', ->
    scope.addChild()
    expect(scope.children.length).toBe(1)
    expect(scope.children[0]).toBe(scope.me.children[0])

    scope.addChild()
    expect(scope.children.length).toBe(2)
    expect(scope.children[1]).not.toBe(scope.me.children[0])
    expect(scope.children[1]).toBe(scope.children[0].children[0])

  it 'removeChild', ->
    scope.addChild()
    scope.addChild()
    scope.addChild()

    expect(scope.children.length).toBe(3)
    expect(scope.me.children.length).toBe(1)
    expect(scope.children[0].children.length).toBe(1)
    expect(scope.children[1].children.length).toBe(1)
    expect(scope.children[2].children.length).toBe(0)

    scope.removeChild()
    expect(scope.children.length).toBe(2)
    expect(scope.me.children.length).toBe(1)
    expect(scope.children[0].children.length).toBe(1)
    expect(scope.children[1].children.length).toBe(0)
    expect(scope.children[2]).not.toBeDefined()

    scope.removeChild()
    expect(scope.children.length).toBe(1)
    expect(scope.me.children.length).toBe(1)
    expect(scope.children[0].children.length).toBe(0)

    scope.removeChild()
    expect(scope.children.length).toBe(0)
    expect(scope.me.children.length).toBe(0)
