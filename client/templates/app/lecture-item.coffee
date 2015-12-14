Template.lectureItem.helpers
  videoDone: ->
    "checked" if Meteor.user()?.profile.done[@id]?.video
  readingDone: ->
    "checked" if Meteor.user()?.profile.done[@id]?.reading
  exerciseDone: ->
    "checked" if Meteor.user()?.profile.done[@id]?.exercise

Template.lectureItem.events
  'change input[type="checkbox"]': (e) ->
    if Meteor.user()
      field = 'profile.done.' + @id + '.' + e.target.name
      set = {}
      set[field] = e.target.checked
      Meteor.users.update Meteor.userId(), $set: set
    else
      showSignup()
