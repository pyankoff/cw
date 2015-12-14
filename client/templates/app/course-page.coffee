Template.coursePage.helpers
  course: ->
    id = FlowRouter.getParam 'id'
    Courses.findOne(id)

Template.lectureItem.helpers
  videoDone: ->
    "checked" if Meteor.user()?.profile.done[@id]?.video
  readingDone: ->
    "checked" if Meteor.user()?.profile.done[@id]?.reading
  exerciseDone: ->
    "checked" if Meteor.user()?.profile.done[@id]?.exercise

Template.lectureItem.events
  "change input[type='checkbox']": (e) ->
    field = 'profile.done.' + @id + '.' + e.target.name
    set = {}
    set[field] = e.target.checked
    Meteor.users.update Meteor.userId(), $set: set


Template.coursePage.onCreated ->
  self = this
  self.autorun ->
    id = FlowRouter.getParam 'id'
    self.subscribe 'course', id

Template.coursePage.onRendered ->
  tour = new Tour {
  storage: false,
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
    tour.init(true)
    tour.start(true)
  , 300
