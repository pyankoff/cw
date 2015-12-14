Meteor.publish 'all', () ->
	[Courses.find {}
	Lectures.find {}]

Meteor.publish 'courses', (ids) ->
	Courses.find {_id: {$in: ids}}

Meteor.publishComposite 'course', (courseId) ->
	find: ->
		Courses.find {_id: courseId}
	children: [
		find: (course) ->
			Lectures.find {
				_id: {$in: course.lectures}
			}
	]

Meteor.publish 'lecture', (id) ->
	Lectures.find {_id: id}
