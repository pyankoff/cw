Template.coursePage.helpers
  course: ->
    id = FlowRouter.getParam 'id'
    Courses.findOne(id)

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
    self.subscribe 'all'
