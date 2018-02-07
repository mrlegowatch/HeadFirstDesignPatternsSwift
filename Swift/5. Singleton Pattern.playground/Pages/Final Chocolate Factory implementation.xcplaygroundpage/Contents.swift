//: [Previous](@previous)
//: # The final Chocolate Factory implementation
//:
//: The final Chocolate Factory implementation places the relevant code in source files, and the playground takes the role of just running the test.

let boiler = ChocolateBoiler.instance

boiler.fill()
boiler.boil()
boiler.drain()

// will return the existing instance
let boiler2 = ChocolateBoiler.instance

//: [Next](@next)
