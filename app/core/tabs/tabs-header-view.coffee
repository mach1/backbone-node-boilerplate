Backbone = require "backbone"
Backbone.$ = require "jquery"
Backbone.Marionette = require "backbone.marionette"

Template = require "./tabs-header-template.hbs"

class TabsHeaderView extends Backbone.Marionette.ItemView
  initialize: (options) ->
    @tabs = options.tabs

  events:
    "click .tab-header": "changeTab"

  template: =>
    return Template(tabs: @tabs)

  changeTab: (e) ->
    id = e.target.id.split("-")[1]
    this.trigger "changeTab", id: id

module.exports = TabsHeaderView
