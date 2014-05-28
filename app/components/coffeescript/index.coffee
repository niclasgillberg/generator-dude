module.exports =
  setup: (options) ->

  loadDependencies: (options) ->
    return client: [], server: [], devClient: [], devServer: []

  loadTasks: (options) ->
    return ['grunt-contrib-coffee', 'grunt-contrib-watch']