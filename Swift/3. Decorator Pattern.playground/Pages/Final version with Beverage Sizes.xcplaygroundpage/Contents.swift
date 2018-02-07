//: [Previous](@previous)
//: ## Final Version with Beverage Sizes
//:
//: The final Starbuzz with Beverage Sizes implementation places the relevant code in source files, and the playground takes the role of just running the test.
//:
//: Note: the book example only extends Soy.cost() to illustrate the addition of size.
//:
//: The implementation deviates from the book in the following ways:
//:  - makes all properties 'let' (read-only)
//:  - leverages the description getter, instead of adding and overriding a getDescription() function
//:  - concatenates the descriptions in CondimentDecorator.init(), instead of in a getDescription() function
//:  - Soy.cost() implements a switch statement instead of if-then-else statements
//:  - HouseBlend.cost() implements a switch statement, so that a venti drink is more expensive than a tall drink

let beverage = Espresso()
print("\(beverage.description) $\(beverage.cost())")

var beverage2: Beverage = DarkRoast()
beverage2 = Mocha(beverage2)
beverage2 = Mocha(beverage2)
beverage2 = Whip(beverage2)
print("\(beverage2.size) \(beverage2.description) $\(beverage2.cost())")

var beverage3: Beverage = HouseBlend(size: .venti)
beverage3 = Soy(beverage3)
beverage3 = Mocha(beverage3)
beverage3 = Whip(beverage3)
print("\(beverage3.size) \(beverage3.description) $\(beverage3.cost())")

//: [Next](@next)
