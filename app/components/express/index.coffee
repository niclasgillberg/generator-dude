module.exports =
  setup: (options) ->
    @mkdir 'src/server/config'
    @mkdir 'src/server/views'

    lang = options.language || 'js'

    @copy "../components/express/files/#{lang}/app.#{lang}", "src/server/app.#{lang}"

    if !options.framework
      @copy "../components/express/files/index.jade", "src/server/views/index.jade"

  loadDependencies: (options) ->


  loadTasks: (options) ->
