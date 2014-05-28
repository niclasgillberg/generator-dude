module.exports =
  setup: (options) ->
    @mkdir 'src/client/styles'

    @copy "../components/stylus/files/application.styl", "src/client/styles/application.styl"

  loadDependencies: (options) ->


  loadTasks: (options) ->
