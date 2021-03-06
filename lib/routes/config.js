FlowRouter.notFound = {
  action() {
    BlazeLayout.render( 'default', { yield: 'notFound' } );
  }
};

if ( Meteor.isClient ) {
  Tracker.autorun( () => {
    if ( !Meteor.userId() && FlowRouter.current().route ) {
      FlowRouter.go( 'landing' );
    }
  });
}

AccountsTemplates.configureRoute('signUp');
AccountsTemplates.configureRoute('signIn');
AccountsTemplates.configureRoute('forgotPwd');
AccountsTemplates.configureRoute('resetPwd');
