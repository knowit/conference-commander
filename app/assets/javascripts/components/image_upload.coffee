class App.ImageUpload extends App.Component

  constructor: (ctx) ->
    super(ctx)
    @$fileupload = @$container.find('.image-upload-form')
    @bind()

  bind: ->
    @$fileupload.each ->
      $(this).fileupload
        dataType: 'script'
        done: (e, data) ->
        fail: (e, data) ->
          # We need to reload to refresh the file field.
          window.location.reload()
        add: (e, data) ->
          file = data.files[0]
          data.submit()
