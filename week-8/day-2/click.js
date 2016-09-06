$(document).ready(function() {
  $("li").on("click", function() {
    $(this).toggleClass("clicked")
  })

  $("a").on("click", function(event) {
    $(this).toggleClass("clicked")
    event.preventDefault()
  })
})

// Direct DOM approach
// var allItems = document.querySelectorAll("li")
//
// allItems.forEach(function(element) {
//   element.onclick = function(event) {
//     event.target.classList.add("clicked")
//   }
// })
