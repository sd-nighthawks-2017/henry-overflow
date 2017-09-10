$(document).ready(function() {bindClickEvents() })

function bindClickEvents() {
//Intercept the form submission event using JQuery
$('.make-question-button').on('click', handleFormSubmit)
}

// Prevent the default action for that event from happening
// Use jQuery to submit an AJAX post to the form's action
function handleFormSubmit(event) {
  console.log("This is the handleFormSubmit")
  event.preventDefault()
  var ajax_options = {
    url: $(this).attr('href'),
    headers: { Accept: 'application/json' }
  }

// When the AJAX post is done, display the updated number of votes using JQuery
  var $ajax = $.ajax(ajax_options)
  $ajax.done(ajaxDoneHandler.bind(this))
};

// Function that handles when ajax is done, gets called in $ajax.done

function ajaxDoneHandler(response) {
  console.log("This is the ajaxDoneHandler")
  var responseObject = JSON.parse(response)
  console.log(response)
  $(this).closest('tr').find('#vote-num').html(responseObject.votes[0].value)
}

$(document).ready(function(){
  $('ol li a').click(function(){
    $('li a').removeClass("active");
      $(this).addClass("active")
  });
});
