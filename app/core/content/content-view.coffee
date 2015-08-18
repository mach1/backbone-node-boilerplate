Backbone = require "backbone"
Backbone.$ = require "jquery"
Backbone.Marionette = require "backbone.marionette"

Template = require "./content-template.hbs"
TabView = require "./../tabs/tabs-view.coffee"

module.exports = Backbone.Marionette.ItemView.extend
  template: Template()
