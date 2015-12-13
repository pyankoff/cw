Meteor.publish 'all', () ->
	[Courses.find {}
	Lectures.find {}]
