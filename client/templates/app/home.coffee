Template.home.helpers
  courses: ->
    Courses.find()

Template.home.events
  "click .btn-new": (e) ->
    Modal.show('searchModal')

Template.home.onCreated ->
  self = this
  self.autorun ->
    courseIds = Meteor.user().profile.courses
    self.subscribe 'courses', courseIds
