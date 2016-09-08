$(document).ready(function(){
  // Logging to show if/when we reload the page
  window.setInterval(function() {
    $(".log").prepend("<p>" + new Date().toString() + "</p")
  }, 1000)
})
