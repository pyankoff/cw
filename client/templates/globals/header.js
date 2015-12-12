Template.header.helpers({
  brandLink() {
    let landing = FlowRouter.path( 'landing' ),
        home = FlowRouter.path( 'home' );
    return !Meteor.loggingIn() && !Meteor.userId() ? landing : home;
  }
});

Template.header.events({
  'click .logout' () {
    Meteor.logout( ( error ) => {
      if ( error ) {
        Bert.alert( error.reason, 'warning' );
      } else {
        Bert.alert( 'Logged out!', 'success' );
      }
    });
  }
});
