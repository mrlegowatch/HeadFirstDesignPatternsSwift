//: [Previous](@previous)
//: ## Condiments as Boolean values

class Beverage {
    var description = "Unknown beverage"
    
    // Boolean values for each condiment.
    // IN SWIFT: This could be better presented as a Swift OptionSet.
    struct Condiments: OptionSet {
        let rawValue: Int
        
        static let milk = Condiments(rawValue: 1)
        static let soy = Condiments(rawValue: 2)
        static let mocha = Condiments(rawValue: 4)
        static let whip = Condiments(rawValue: 8)
    }
    var condiments: Condiments = []
    
    // The superclass cost() will calculate the costs for all of the condiments, while the overridden cost() in the subclasses will extend that functionality to include costs for that specific beverage type.
    // Each cost method needs to compute the cost of the beverage and then add in the condiments by calling the superclass implementation of cost().
    func cost() -> Double {
        var condimentCost = 0.0
        
        if condiments.contains(.milk) {
            condimentCost += 0.90
        } else if condiments.contains(.soy) {
            condimentCost += 1.10
        } else if condiments.contains(.mocha) {
            condimentCost += 0.45
        } else if condiments.contains(.whip) {
            condimentCost += 0.25
        }
        
        return condimentCost
    }

}

class DarkRoast: Beverage {
    
    override init() {
        super.init()
        description = "Most Excellent Dark Roast"
    }
    
    override func cost() -> Double {
        return 1.99 + super.cost()
    }
}


//: [Next](@next)
