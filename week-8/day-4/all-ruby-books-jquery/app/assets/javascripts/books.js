$(document).ready(function() {
  // Logging to show if/when we reload the page
  window.setInterval(function() {
    $(".log").prepend("<p>" + new Date().toString() + "</p")
  }, 1000)

  $(window).bind("popstate", function(event) {
    var author_id = event.originalEvent.state.author_id;

    $.getScript({ url: "/books", data: { author_id: author_id } })

    $('#author_id').val(author_id)
  })
})

$(document).on('turbolinks:load', function() {
  $("#author_id").on('change', function(event) {
    var author_id = $(this).val()

    $.getScript({ url: "/books", data: { author_id: author_id } }).done(function() {
      history.pushState({author_id: author_id}, document.title, "/books?author_id=" + author_id)
    })
  })

})
