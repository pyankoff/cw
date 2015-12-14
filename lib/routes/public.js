const homeRedirect = () => {
  if ( Meteor.userId() ) {
    FlowRouter.go( 'home' );
  }
};

FlowRouter.route( '/', {
  name: 'landing',
  triggersEnter: [ homeRedirect ],
  action() {
    BlazeLayout.render( 'default', { yield: 'landing' } );
  }
});


FlowRouter.route( '/course/:id/:section?', {
  name: 'course',
  action() {
    BlazeLayout.render( 'default', { yield: 'coursePage' } );
  }
});

FlowRouter.route('/lecture/:id', {
  name: 'lecture',
  action() {
    BlazeLayout.render( 'default', { yield: 'lecture' } );
  }
});
