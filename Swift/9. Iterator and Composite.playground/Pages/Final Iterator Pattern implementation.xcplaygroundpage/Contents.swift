//: [Previous](@previous)
//: ## The Final Iterator Pattern implementation
//:
//: The final Iterator implementation places the relevant code in source files, and the playground takes the role of just running the test.
//:

let pancakeHouseMenu = PancakeHouseMenu()
let dinerMenu = DinerMenu()
let caféMenu = CaféMenu()

let waitress = Waitress([pancakeHouseMenu, dinerMenu, caféMenu])

waitress.printMenu()

//: [Next](@next)
