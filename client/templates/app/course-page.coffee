tour =

Template.coursePage.helpers
  course: ->
    id = FlowRouter.getParam 'id'
    Courses.findOne(id)
  isLearning: ->
    _.contains Meteor.user()?.profile?.courses, @_id
  sectionList: ->
    section = FlowRouter.getParam 'section'
    if section
      'assetList'
    else
      'lectureList'

Template.assetList.helpers
  assets: ->
    section = FlowRouter.getParam 'section'
    _.filter @assets, (x) -> x.type is section




Template.coursePage.events
  'click .course-title .btn-success': (e) ->
    if Meteor.userId()
      Meteor.users.update Meteor.userId(),
      $addToSet:{
        'profile.courses': @_id
      }
      Bert.alert 'Course added to your list', 'success'
    else
      showSignup()
  'click .course-title .btn-default': (e) ->
    Meteor.users.update Meteor.userId(),
    $pull:{
      'profile.courses': @_id
    }
    Bert.alert 'Course removed from your list', 'info'

Template.coursePage.onCreated ->
  self = this
  self.autorun ->
    id = FlowRouter.getParam 'id'
    self.subscribe 'course', id

Template.coursePage.onRendered ->
  tour = new Tour {
  template: "<div class='popover tour'>
  <div class='arrow'></div>
  <h3 class='popover-title'></h3>
  <i class='fa fa-times' data-role='end'></i></button>
  <div class='popover-content'></div>
    <div class='popover-navigation'>
      <button class='btn btn-default' data-role='next'>Next »</button>
    </div>
  </div>",
  steps: [
    {
      element: ".list-group",
      placement: "top",
      title: "All course content",
      content: "See all course content in one convenient view"
    },
    {
      element: ".progress",
      title: "Progress",
      content: "Track your progress",
      template:"<div class='popover tour'>
        <div class='arrow'></div>
        <h3 class='popover-title'></h3>
        <div class='popover-content'></div>
        <div class='popover-navigation'>
          <button class='btn btn-default' data-role='end'>End tour</button>
        </div>
      </div>"
    }
  ]}

  Meteor.setTimeout ->
    tour.init()
    tour.start()
  , 300

Template.coursePage.onDestroyed ->
  tour.end()
  swal.close()
