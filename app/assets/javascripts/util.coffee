window.PPush = {}

UTIL =

  exec: (controller, action) ->

    handler    = PPush
    action     = if action == undefined then 'init' else action
    controller = controller.replace(/\//g, '_')

    if handler[controller]
      handler = handler[controller]
    if handler and typeof handler[action] == 'function'
      handler[action]()

  init: ->

    controller = $('body').data('controller')
    action     = $('body').data('action')

    UTIL.exec 'common'
    UTIL.exec controller
    UTIL.exec controller, action

$ UTIL.init
