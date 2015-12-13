Template.lecture.onCreated ->
  window.onYouTubeIframeAPIReady = () ->
    @player = new YT.Player "player", {
      width: "100%",
      height: "250",
      videoId: "Ei8CFin00PY"
    }
  YT.load()
  Meteor.setInterval ->
    Session.set 'progress',
        percentage @player?.getCurrentTime() / @player?.getDuration()
  , 3000

Template.lecture.helpers
  progress: ->
    Session.get 'progress'
