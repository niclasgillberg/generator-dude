module.exports =
  whichJsFramework:
    type: 'list'
    name: 'jsFramework'
    message: 'Your preferred Javascript framework?'
    choices: [
      key: 'a'
      name: 'Angular'
      value: 'angular'
#    ,
#      key: 'd'
#      name: 'Durandal'
#      value: 'durandal'
#    ,
#      key: 'e'
#      name: 'Ember'
#      value: 'ember'
    ]
    default: 0
  whichPreprocessor:
    type: 'list'
    name: 'preprocessor'
    message: 'Your preferred styling preprocessor?'
    choices: [
#      key: 'l'
#      name: 'LESS'
#      value: 'less'
#    ,
#      key: 'c'
#      name: 'SCSS'
#      value: 'scss'
#    ,
      key: 't'
      name: 'Stylus'
      value: 'styl'
    ]
    default: 2
  whichCssFramework:
    type: 'list'
    name: 'cssFramework'
    message: 'Your preferred CSS framework?'
    choices: [
#      key: 'b'
#      name: 'Bootstrap'
#      value: 'bootstrap'
#    ,
      key: 'f'
      name: 'Foundation'
      value: 'foundation'
    ]
    default: 1
  useExpress:
    type: 'confirm'
    name: 'useExpress'
    message: 'Use Express.js?'
  whichLanguage:
    type: 'list'
    name: 'language'
    message: 'Your preferred language?'
    choices: [
#      key: 'j'
#      name: 'JavaScript'
#      value: 'js'
#    ,
      key: 'c'
      name: 'CoffeeScript'
      value: 'coffee'
    ]
    default: 1