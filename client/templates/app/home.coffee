Template.home.helpers
  courses: ->
    Courses.find()

Template.home.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'all'
