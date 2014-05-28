module.exports =
  setup: (options) ->
    @mkdir 'src'
    @mkdir 'src/client'
    @mkdir 'src/server'
    @mkdir 'dist'
    @mkdir 'dist/client'
    @mkdir 'dist/server'
    @mkdir 'spec'
    @mkdir 'tasks'