Template.courseSearch.helpers
  courseIndex: -> CourseIndex
  inputAttributes: -> {id: "search-input"}
  loadMoreAttr: -> {class: "btn btn-default load-more"}

Template.courseSearch.events
  "click a": (e) ->
    Modal.hide()
