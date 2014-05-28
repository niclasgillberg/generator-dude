module.exports =
  setup: (options) ->
    @mkdir 'src/client/modules/application/controllers'
    @mkdir 'src/client/modules/application/views'

    lang = options.language || 'js'

    @copy "../components/angular/files/#{lang}/application/module.#{lang}","src/client/modules/application/module.#{lang}"
    @copy "../components/angular/files/#{lang}/application/ApplicationCtrl.#{lang}","src/client/modules/application/controllers/ApplicationCtrl.#{lang}"
    @copy "../components/angular/files/#{lang}/application/application.html","src/client/modules/application/templates/application.html"

    if !options.useServer
      @copy '../components/angular/files/index.html', 'src/client/index.html'
    else
      @copy '../components/angular/files/index.jade', 'src/server/views/index.jade'

  loadDependencies: (options) ->
    return client: [], server: [], devClient: [], devServer: []

  loadTasks: (options) ->
    return []