//: # Chapter 3: The Decorator Pattern
//:
//: Comments are from the Head First Design Patterns book.
//:
//: Where Swift deviates from the book, the annotation "IN SWIFT" is used in the comment.
//:
//: ## Welcome to Starbuzz Coffee

// Beverage is an abstract class, subclassed by all beverages offered in the coffee shop.
protocol Beverage {
    // The description instance variable is set in each subclass and holds a descripion of the beverage, like "Most Excellent Dark Roast".
    var description: String { get }
    
    // The cost() method is abstract; subclasses need to define their own implementation.
    func cost() -> Double
}

class HouseBlend: Beverage {
    let description = "House Blend"
    func cost() -> Double {
        return 1.99
    }
}

class DarkRoast: Beverage {
    let description = "Dark Roast"
    func cost() -> Double {
        return 1.99
    }
}

class Decaf: Beverage {
    let description = "Decaf"
    func cost() -> Double {
        return 1.99
    }
}

class Espresso: Beverage {
    let description = "Espresso"
    func cost() -> Double {
        return 1.99
    }
}

//: Here's the first attempt at including condiments.

// Class explosion follows...

class HouseBlendWithSteamedMilk: Beverage {
    let description = "..."
    func cost() -> Double {
        return 2.89
    }
}

class HouseBlendWithMocha: Beverage {
    let description = "..."
    func cost() -> Double {
        return 2.44
    }
}

class HouseBlendWithSteamedMilkAndMocha: Beverage {
    let description = "..."
    func cost() -> Double {
        return 4.95
    }
}

class DarkRoastWithSteamedMilkAndCaramel: Beverage {
    let description = "..."
    func cost() -> Double {
        return 4.95
    }
}

class DarkRoastWithSteamedMilkAndSoy: Beverage {
    let description = "..."
    func cost() -> Double {
        return 4.95
    }
}

class DecafWithSoy: Beverage {
    let description = "..."
    func cost() -> Double {
        return 4.95
    }
}

class DecafWithSoyAndMocha: Beverage {
    let description = "..."
    func cost() -> Double {
        return 4.95
    }
}

class HouseBlendWithWhippedSoy: Beverage {
    let description = "..."
    func cost() -> Double {
        return 4.95
    }
}

// etc., you get the idea.

//: [Next](@next)
