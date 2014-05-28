global = require './components/global'
ember = require './components/ember'
angular = require './components/angular'
durandal = require './components/durandal'
express = require './components/express'
stylus = require './components/stylus'

module.exports =
  global: global
  frameworks:
    'ember': ember
    'angular': angular
    'durandal': durandal
  server:
    'express': express
  preprocessors:
    'styl': stylus