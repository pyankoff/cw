Template.coursePage.helpers
  course: ->
    id = FlowRouter.getParam 'id'
    Courses.findOne(id)

Template.lectureItem.helpers
  videoDone: ->
    "checked" if Meteor.user().profile.done[@id]?.video
  readingDone: ->
    "checked" if Meteor.user().profile.done[@id]?.reading
  exerciseDone: ->
    "checked" if Meteor.user().profile.done[@id]?.exercise

Template.lectureItem.events
  "change input[type='checkbox']": (e) ->
    field = 'profile.done.' + @id + '.' + e.target.name
    set = {}
    set[field] = e.target.checked
    Meteor.users.update Meteor.userId(), $set: set


Template.coursePage.onCreated ->
  self = this
  self.autorun ->
    id = FlowRouter.getParam 'id'
    self.subscribe 'course', id
