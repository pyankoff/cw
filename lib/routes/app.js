const authRedirect = () => {
  if ( !Meteor.loggingIn() && !Meteor.userId() ) {
    FlowRouter.go( 'atSignIn' );
  }
};

const authenticatedRoutes = FlowRouter.group({
  name: 'authenticated',
  triggersEnter: [ authRedirect ]
});

authenticatedRoutes.route( '/home', {
  name: 'home',
  action() {
    BlazeLayout.render( 'default', { yield: 'home' } );
  }
});

authenticatedRoutes.route( '/dashboard', {
  name: 'dashboard',
  action() {
    BlazeLayout.render( 'default', { yield: 'dashboard' } );
  }
});

authenticatedRoutes.route( '/course/:id', {
  name: 'course',
  action() {
    BlazeLayout.render( 'default', { yield: 'coursePage' } );
  }
});

authenticatedRoutes.route('/lecture/:id', {
  name: 'lecture',
  action() {
    BlazeLayout.render( 'default', { yield: 'lecture' } );
  }
});
