//: [Previous](@previous)
//: # The final Barista implementation
//:
//: The final Barista implementation places the relevant code in source files, and the playground takes the role of just running the test.
//:


//: Beverage test drive

let tea = Tea()
let coffee = Coffee()

print("\nMaking tea...")
tea.prepareRecipe()

print("\nMaking coffee...")
coffee.prepareRecipe()

print("\nBeverages with hooks")

let teaHook = TeaWithHook()
let coffeeHook = CoffeeWithHook()

print("\nMaking tea...")
teaHook.prepareRecipe()

print("\nMaking coffee...")
coffeeHook.prepareRecipe()

//: [Next](@next)
