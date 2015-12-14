Template.progress.helpers
  progress: ->
    count = 0
    for i, lecture of @lectures
      done = Meteor.user().profile.done[lecture.id]
      n = _.filter done, (x) ->
          x
        .length
      count += n

    percentage(count/(@lectures.length*3)) if count > 0
