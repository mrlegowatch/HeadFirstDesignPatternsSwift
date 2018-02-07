//: [Previous](@previous)
//: ## Decorating our Beverages

// Beverage acts as our abstract component class
protocol Beverage {
    // IN SWIFT: In this section, we're going to specify a protocol, so the description must be implemented in all subclasses. This causes the condiment decorator to become an empty protocol, in this example. In the next section, the final version with beverage sizes, we'll specify a base class, which will provide the storage for description in all subclasses.
    var description: String { get }
    
    func cost() -> Double
}

// First, we need to be interchangeable with a Beverage, so we extend the Beverage class.
protocol CondimentDecorator: Beverage {
    // We're also going to require that the condiment decorators all reimplement the description method. Again, we'll see why in a sec.
}

//: Coding beverages

class Espresso: Beverage {
    // To take care of the description, we set this in the constructor for the class.
    // IN SWIFT: we initialize a constant that matches the get-only property in the protocol.
    let description = "Espresso"
    
    func cost() -> Double {
        return 1.99
    }
}

class HouseBlend: Beverage {
    let description = "House Blend Coffee"
    
    func cost() -> Double {
        return 0.89
    }
}

class DarkRoast: Beverage {
    let description = "Dark Roast Coffee"
    
    func cost() -> Double {
        return 0.99
    }
}

class Decaf: Beverage {
    let description = "Decaf Coffee"
    
    func cost() -> Double {
        return 1.05
    }
}

//: Coding condiments

// Remember, CondimentDecorator extends beverage.
class Mocha: CondimentDecorator {
    // We're going to instantiate Mocha with a reference to a Beverage using:
    // (1) An instance variable to hold the beverage we are wrapping
    // (2) A way to set this instance variable to the object we are wrapping.
    let beverage: Beverage
    
    // Here, we 're going to pass the beverage we're wrapping to the decorator's constructor.
    init(_ beverage: Beverage) {
        self.beverage = beverage
    }
    
    var description: String {
        // We want our description to not only include the beverage--say, "Dark Roast"--but also to include each item decorating the beverage (for instances, "Dark Roast, Mocha"). So we first delegate to the object we are decorating, then append ", Mocha" to that description.
        return beverage.description + ", Mocha"
    }
    
    func cost() -> Double {
        // We need to compute the cost of our beverage with Mocha. First we delegate the call to the object we're decorating, so that it can compute its cost; then, we add the cost of Mocha to the result.
        return beverage.cost() + 0.20
    }
}

class Milk: CondimentDecorator {
    let beverage: Beverage
    
    init(_ beverage: Beverage) {
        self.beverage = beverage
    }
    
    var description: String {
        return beverage.description + ", Milk"
    }
    
    func cost() -> Double {
        return beverage.cost() + 0.10
    }
}

class Soy: CondimentDecorator {
    let beverage: Beverage
    
    init(_ beverage: Beverage) {
        self.beverage = beverage
    }
    
    var description: String {
        return beverage.description + ", Soy"
    }
    
    func cost() -> Double {
        return beverage.cost() + 0.15
    }
}

class Whip: CondimentDecorator {
    let beverage: Beverage
    
    init(_ beverage: Beverage) {
        self.beverage = beverage
    }
    
    var description: String {
        return beverage.description + ", Whip"
    }
    
    func cost() -> Double {
        return beverage.cost() + 0.10
    }
}

// Order up an espresso, no condiments, and print its description and cost.
let beverage = Espresso()
print("\(beverage.description) $\(beverage.cost())")

// Make a DarkRoast object. Wrap it with a Mocha. Wrap it with a second Mocha. Wrap it in a Whip.
var beverage2: Beverage = DarkRoast()
beverage2 = Mocha(beverage2)
beverage2 = Mocha(beverage2)
beverage2 = Whip(beverage2)
print("\(beverage2.description) $\(beverage2.cost())")

// Finally, give us a House Blend with Soy, Mocha, and Whip.
var beverage3: Beverage = HouseBlend()
beverage3 = Soy(beverage3)
beverage3 = Mocha(beverage3)
beverage3 = Whip(beverage3)
print("\(beverage3.description) $\(beverage3.cost())")

//: [Next](@next)
