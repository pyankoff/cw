Template.courseItem.helpers
  signedUp: ->
    _.contains Meteor.user()?.profile?.courses, @_id
