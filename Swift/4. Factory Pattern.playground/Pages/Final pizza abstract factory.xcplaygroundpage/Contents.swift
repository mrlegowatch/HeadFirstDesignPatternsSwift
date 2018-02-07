//: [Previous](@previous)
//: # The Final Pizza Abstract Factory
//:
//: The final Pizza abstract factory implementation places the relevant code in source files, and the playground takes the role of just running the test.

let nyStore = NYPizzaStore()
let chicagoStore = ChicagoPizzaStore()

var pizza = nyStore.orderPizza("cheese")
print("Ethan ordered a \(pizza.name)")
pizza = chicagoStore.orderPizza("cheese")
print("Joel ordered a \(pizza.name)")

//: [Next](@next)
