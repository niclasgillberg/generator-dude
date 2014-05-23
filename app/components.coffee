global = require './components/global'
ember = require './components/ember'
angular = require './components/angular'
durandal = require './components/durandal'

module.exports =
  global: global
  frameworks:
    'ember': ember
    'angular': angular
    'durandal': durandal