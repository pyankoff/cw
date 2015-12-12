FlowRouter.route( '/', {
  name: 'home',
  action() {
    BlazeLayout.render( 'default', { yield: 'landing' } );
  }
});

FlowRouter.route('/page/:id', {
  name: 'page',
  action() {
    BlazeLayout.render( 'default', { yield: 'page' } );
  }
});

AccountsTemplates.configureRoute('signUp');
AccountsTemplates.configureRoute('signIn');
AccountsTemplates.configureRoute('forgotPwd');
AccountsTemplates.configureRoute('resetPwd');
