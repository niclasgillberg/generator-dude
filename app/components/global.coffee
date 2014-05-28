module.exports =
  setup: (options) ->
    @mkdir 'src'
    @mkdir 'src/client'
    @mkdir 'dist'
    @mkdir 'dist/client'
    @mkdir 'spec'
    @mkdir 'tasks'
    if @useExpress
      @mkdir 'src/server'
      @mkdir 'dist/server'
