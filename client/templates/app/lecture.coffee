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
