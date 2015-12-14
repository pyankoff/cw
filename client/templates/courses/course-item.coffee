Template.courseItem.helpers
  signedUp: ->
    _.contains Meteor.user()?.profile?.courses, @_id
  courseId: ->
    if @__originalId then @__originalId else @_id
