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

authenticatedRoutes.route('/item/:id', {
  name: 'item',
  action() {
    BlazeLayout.render( 'default', { yield: 'item' } );
  }
});
