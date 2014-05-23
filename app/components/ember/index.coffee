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

  loadDependencies: (options) ->
    clientDependencies = ['ember']

    return client: clientDependencies