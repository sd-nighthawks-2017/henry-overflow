This function will display the question details without refreshing page

$(document).ready(function() {bindClickEvents() })

// Intercept the form submission event using JQuery
function bindClickEvents() {
  console.log("inside the bindClickEvents")
  $('.home-questions').fadeIn().on('click', showClickHandler)
}

// Prevent the default action for that event from happening
// Use jQuery to submit an AJAX post to the form's action
function showClickHandler(event) {
  console.log("inside the handleFormSubmit")
  event.preventDefault()
  var ajax_options = {
    url: $(this).attr('href'),
    headers: { Accept: "application/json" }
  }

// When the AJAX post is done, display the question details using JQuery
  var $ajax = $.ajax(ajax_options)
  $ajax.done(ajaxDoneHandler.bind(this))
};

// Function that handles when ajax is done, gets called in $ajax.done

function ajaxDoneHandler(response) {
  // var responseObject = JSON.parse(response)
  console.log("inside the ajaxDoneHandler")
  console.log(response)
  console.log(this)
  $(this).closest('li').append(response)
}
