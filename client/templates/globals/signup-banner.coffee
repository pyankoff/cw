Template.signupBanner.helpers
  showBanner: ->
    routeName = FlowRouter.getRouteName()
    routeName in ['course', 'lecture'] and
    not (Meteor.loggingIn() or Meteor.userId())
