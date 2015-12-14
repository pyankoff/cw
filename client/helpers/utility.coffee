window.percentage = (n) ->
  String(Math.round(n*100)) + "%"

window.showSignup = () ->
  swal {
      title: "Sign up to save your progress",
      html: true,
      text: Blaze.toHTMLWithData(Template.atForm, {state: 'signUp'}),
      type: "info",
      showConfirmButton: false
    }
