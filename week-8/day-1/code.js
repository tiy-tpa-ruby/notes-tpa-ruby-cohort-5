// var my_first_object = {
//   name: "Gavin",
//   number: 42,
//   doit: function(color) {
//     console.log(this.name + " color is " + color)
//   }
// }
//
// my_first_object.doit()

var myNumbers = {
  numbers: [1,2,3,4,42],

  // Ruby Style
  // def addSome
  //   self.numbers.each do |number|
  //     puts number
  //   end
  // end
  addSome: function() {
    var savedCopyOfThis = this

    this.numbers.forEach(function(number) {
      // Inside here `this` isn't our object any more
      var newNumber = number + 7

      savedCopyOfThis.numbers.push(newNumber)

      console.log(number)
    })

    // But here it is back
    console.log(this.numbers)
  }
}

myNumbers.addSome()
