path = require 'path'
yeoman = require 'yeoman-generator'
questions = require './questions'
components = require './components'

module.exports = class DudeGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    yeoman.generators.Base.apply this, arguments
    @on 'end', ->
      @installDependencies skipInstall: options['skip-install']

    @pkg = JSON.parse @readFileAsString path.join __dirname, '../package.json'
    @clientDependencies = []
    @serverDependencies = []
    @devServerDependencies = []
    @tasks = []

  askFor: ->
    cb = @async()

    # have Yeoman greet the user.
    console.log @yeoman
    prompts = [
      questions.whichLanguage,
      questions.whichJsFramework,
      questions.whichPreprocessor,
      questions.whichCssFramework,
      questions.useExpress
    ]
    @prompt prompts, (props) =>
      @language = props.language
      @framework = props.jsFramework
      @preprocessor = props.preprocessor
      @cssFramework = props.cssFramework
      @useExpress = props.useExpress
      cb()

  projectfiles: ->
    @copy 'editorconfig', '.editorconfig'
    @copy 'jshintrc', '.jshintrc'
    @copy 'bowerrc', '.bowerrc'

  app: ->
    components.global.setup.call @

    if @useExpress
      components.server.express.setup.call @,
        language: @language
        framework: @framework

    preprocessor = components.preprocessors[@preprocessor]
    preprocessor.setup.call @

    framework = components.frameworks[@framework]
    framework.setup.call @,
      language: @language
      useServer: @useExpress

    dependencies = framework.loadDependencies()

    @clientDependencies[dep] = true for dep in dependencies.client
    @devServerDependencies[dep] = true for dep in dependencies.devServer

    @tasks[task] = true for task in framework.loadTasks.call @

    @template '_Gruntfile.coffee', 'Gruntfile.coffee'

  dependencies: ->
    @copy '_package.json', 'package.json'
    @copy '_bower.json', 'bower.json'
