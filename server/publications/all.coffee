Meteor.publish 'all', () ->
	Courses.find {}
