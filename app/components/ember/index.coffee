module.exports =
  setup: (options) ->
    @mkdir 'src/client/components'
    @mkdir 'src/client/config'
    @mkdir 'src/client/controllers'
    @mkdir 'src/client/models'
    @mkdir 'src/client/routes'
    @mkdir 'src/client/templates'
    @mkdir 'src/client/views'

    lang = options.language || 'js'

    @copy "../components/ember/files/#{lang}/application.#{lang}", "src/client/application.#{lang}"

    if !options.useServer
      @copy '../components/ember/files/index.html', 'src/client/index.html'

  loadDependencies: (options) ->
    client = ['ember']
    devServer = ['grunt-ember-templates', 'ember']

    return client: client, server: [], devClient: [], devServer: devServer

  loadTasks: (options) ->
    return ['ember-templates']