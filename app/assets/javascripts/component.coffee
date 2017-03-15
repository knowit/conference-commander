class App.Component

  constructor: (ctx, sel) ->
    # Set context to given parameter or entire document
    @contextSelector = if ctx then ctx else document
    @$context = $(@contextSelector)
    # Find the container if given, else use the entire context
    @$container = if sel then @$context.find(sel) else @$context
