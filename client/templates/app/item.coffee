Template.item.onCreated ->
  window.onYouTubeIframeAPIReady = () ->
    @player = new YT.Player "player", {
      width: "100%",
      height: "400",
      videoId: "Ei8CFin00PY"
    }
  YT.load()
  Meteor.setInterval ->
    Session.set 'progress',
        Math.round @player?.getCurrentTime() / @player?.getDuration() * 100
  , 3000

Template.item.helpers
  progress: ->
    Session.get 'progress'
