tour =

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
    if Meteor.user()
      field = 'profile.done.' + @id + '.' + e.target.name
      set = {}
      set[field] = e.target.checked
      Meteor.users.update Meteor.userId(), $set: set
    else
      swal {
          title: "Sign up to save your progress",
          html: true,
          text: Blaze.toHTMLWithData(Template.atForm, {state: 'signUp'}),
          type: "info",
          showConfirmButton: false
        }


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
