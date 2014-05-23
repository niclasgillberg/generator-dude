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
    @serverDevDependencies = []

  askFor: ->
    cb = @async()

    # have Yeoman greet the user.
    console.log @yeoman
    prompts = [
      questions.whichLanguage,
      questions.whichJsFramework,
      questions.whichPreprocessor,
      questions.useExpress
    ]
    @prompt prompts, (props) =>
      @language = props.language
      @framework = props.jsFramework
      @preprocessor = props.preprocessor
      @useExpress = props.useExpress
      cb()

  projectfiles: ->
    @copy 'editorconfig', '.editorconfig'
    @copy 'jshintrc', '.jshintrc'
    @copy 'bowerrc', '.bowerrc'

  app: ->
    components.global.setup.call @

    console.log @framework
    framework = components.frameworks[@framework]
    framework.setup.call @,
      language: @language

    dependencies = framework.loadDependencies()

    @clientDependencies[dep] = true for dep in dependencies.client

    console.log @clientDependencies


  dependencies: ->
    @copy '_package.json', 'package.json'
    @copy '_bower.json', 'bower.json'
