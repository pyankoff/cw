Template.lecture.onCreated ->
  window.onYouTubeIframeAPIReady = () ->
    id = FlowRouter.getParam 'id'
    Meteor.autorun ->
      lecture = Lectures.findOne id
      @player = new YT.Player "player", {
        width: "100%",
        height: "250",
        videoId: lecture.ytId
      }
  YT.load()
  Meteor.setInterval ->
    Session.set 'progress',
        percentage @player?.getCurrentTime() / @player?.getDuration()
  , 3000

Template.lecture.helpers
  progress: ->
    Session.get 'progress'

Template.lecture.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'all'
