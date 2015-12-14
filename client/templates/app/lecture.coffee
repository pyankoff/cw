progressMonitor =

Template.lecture.helpers
  lecture: ->
    id = FlowRouter.getParam 'id'
    Lectures.findOne {_id: id}
  progress: ->
    Session.get 'progress'

Template.lecture.onCreated ->
  self = this
  id = FlowRouter.getParam 'id'
  self.autorun ->
    self.subscribe 'lecture', id

  window.onYouTubeIframeAPIReady = () ->
    self.autorun ->
      lecture = Lectures.findOne id
      self.player = new YT.Player "player", {
        width: "100%",
        height: "250",
        videoId: lecture.ytId
      }
  YT.load()
  progressMonitor = Meteor.setInterval ->
    Session.set 'progress',
        percentage self.player?.getCurrentTime() / self.player?.getDuration()
  , 3000

Template.lecture.onDestroyed ->
  Meteor.clearInterval progressMonitor
