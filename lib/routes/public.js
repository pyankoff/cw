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
