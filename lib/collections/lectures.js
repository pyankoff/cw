Lectures = new Meteor.Collection( 'lectures' );

Lectures.allow({
  insert: () => true,
  update: () => true,
  remove: () => true
});

Lectures.deny({
  insert: () => false,
  update: () => false,
  remove: () => false
});
