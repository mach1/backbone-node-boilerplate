Backbone = require "backbone"
Backbone.$ = $ = require "jquery"
Backbone.Marionette = require "backbone.marionette"

Template = require "./tabs-template.hbs"
TabsHeaderTemplate = require "./tabs-header-template.hbs"

TabsHeaderView = require "./tabs-header-view.coffee"

class TabsView extends Backbone.Marionette.LayoutView
  template: Template()

  regions:
    tabsHeader: ".tabs-header"
    tabsContent: ".tabs-content"

  initialize: (options) ->
    @tabs = options.tabs

  onRender: ->
    tabsHeader = new TabsHeaderView(tabs: @tabs)
    this.listenTo(tabsHeader, "changeTab", @changeTab)

    this.tabsHeader.show(tabsHeader)
        
    this.setActiveTab 0

  setActiveTab: (id) =>
    TabContentView = @tabs[id].view
    this.tabsContent.show(new TabContentView())

  changeTab: (data) ->
    this.setActiveTab Number(data.id)

module.exports = TabsView
