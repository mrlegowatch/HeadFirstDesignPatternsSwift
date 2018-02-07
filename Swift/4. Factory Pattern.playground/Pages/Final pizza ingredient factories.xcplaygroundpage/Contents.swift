//: [Previous](@previous)
//: The Final Pizza Ingredient Factories
//:
//: The final pizza ingredient factories implementation places the relevant code in source files, and the playground takes the role of just running the test.

let nyStore = NYPizzaStore()
let chicagoStore = ChicagoPizzaStore()

var pizza = nyStore.orderPizza("cheese")
print("Ethan ordered a \(pizza)")

pizza = chicagoStore.orderPizza("cheese")
print("Joel ordered a \(pizza)")

pizza = nyStore.orderPizza("clam")
print("Ethan ordered a \(pizza)")

pizza = chicagoStore.orderPizza("clam")
print("Joel ordered a \(pizza)")

pizza = nyStore.orderPizza("pepperoni")
print("Ethan ordered a \(pizza)")

pizza = chicagoStore.orderPizza("pepperoni")
print("Joel ordered a \(pizza)")

pizza = nyStore.orderPizza("veggie")
print("Ethan ordered a \(pizza)")

pizza = chicagoStore.orderPizza("veggie")
print("Joel ordered a \(pizza)")

//: [Next](@next)
