Backbone = require "backbone"
Backbone.$ = require "jquery"
Backbone.Marionette = require "backbone.marionette"

Template = require "./first-tab-template.hbs"

module.exports = Backbone.Marionette.ItemView.extend
  tagName: "div"
  template: Template()
