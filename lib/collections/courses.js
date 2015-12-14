Courses = new Meteor.Collection( 'courses' );

Courses.allow({
  insert: () => true,
  update: () => true,
  remove: () => true
});

Courses.deny({
  insert: () => false,
  update: () => false,
  remove: () => false
});

CourseIndex = new EasySearch.Index({
  collection: Courses,
  fields: ['name'],
  engine: new EasySearch.MongoDB()
});
