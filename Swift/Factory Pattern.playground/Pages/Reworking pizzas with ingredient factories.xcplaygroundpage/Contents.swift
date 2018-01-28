//: [Previous](@previous)

//: Building the ingredient factories

// IN SWIFT: Use CustomStringConvertible protocol for toString().

protocol Dough: CustomStringConvertible { }

protocol Sauce: CustomStringConvertible { }

protocol Cheese: CustomStringConvertible { }

protocol Veggie: CustomStringConvertible { }

protocol Pepperoni: CustomStringConvertible { }

protocol Clams: CustomStringConvertible { }

protocol PizzaIngredientFactory {
    
    func makeDough() -> Dough
    func makeSauce() -> Sauce
    func makeCheese() -> Cheese
    func makeVeggies() -> [Veggie]
    func makePepperoni() -> Pepperoni
    func makeClams() -> Clams
}

//: Building the New York ingredient factory

class ThinCrustDough: Dough {
    var description: String { return "Thin Crust Dough" }
}

class MarinaraSauce: Sauce {
    var description: String { return "Marinara Sauce" }
}

class ReggianoCheese: Cheese {
    var description: String { return "Reggiano Cheese" }
}

class Garlic: Veggie {
    var description: String { return "Garlic" }
}

class Onion: Veggie {
    var description: String { return "Onion" }
}

class Mushroom: Veggie {
    var description: String { return "Mushroom" }
}

class RedPepper: Veggie {
    var description: String { return "Red Pepper" }
}

class SlicedPepperoni: Pepperoni {
    var description: String { return "Sliced Pepperoni" }
}

class FreshClams: Clams {
    var description: String { return "Fresh Clams from Long Island Sound" }
}

class NYPizzaIngredientFactory: PizzaIngredientFactory {
    
    func makeDough() -> Dough {
        return ThinCrustDough()
    }
    
    func makeSauce() -> Sauce {
        return MarinaraSauce()
    }
    
    func makeCheese() -> Cheese {
        return ReggianoCheese()
    }
    
    func makeVeggies() -> [Veggie] {
        return [Garlic(), Onion(), Mushroom(), RedPepper()]
    }
    
    func makePepperoni() -> Pepperoni {
        return SlicedPepperoni()
    }
    
    func makeClams() -> Clams {
        return FreshClams()
    }

}

//: Building the Chicago ingredient factory

class ThickCrustDough: Dough {
    var description: String { return "ThickCrust style extra thick crust dough" }
}

class PlumTomatoSauce: Sauce {
    var description: String { return "Tomato sauce with plum tomatoes" }
}

class MozzarellaCheese: Cheese {
    var description: String { return "Shredded Mozzarella" }
}

class Spinach: Veggie {
    var description: String { return "Spinach" }
}

class BlackOlives: Veggie {
    var description: String { return "Black Olives" }
}

class Eggplant: Veggie {
    var description: String { return "Eggplant" }
}

class FrozenClams: Clams {
    var description: String { return "Frozen Clams from Chesapeake Bay" }
}

class ChicagoPizzaIngredientFactory: PizzaIngredientFactory {
    
    func makeDough() -> Dough {
        return ThickCrustDough()
    }
    
    func makeSauce() -> Sauce {
        return PlumTomatoSauce()
    }
    
    func makeCheese() -> Cheese {
        return MozzarellaCheese()
    }
    
    func makeVeggies() -> [Veggie] {
        return [BlackOlives(), Spinach(), Eggplant()]
    }
    
    func makePepperoni() -> Pepperoni {
        return SlicedPepperoni()
    }
    
    func makeClams() -> Clams {
        return FrozenClams()
    }
    
}

//: Reworking the Pizzas

class Pizza {
    let name: String
    
    var dough: Dough?
    var sauce: Sauce?
    var veggies: [Veggie] = []
    var cheese: Cheese?
    var pepperoni: Pepperoni?
    var clams: Clams?
    
    init(_ name: String) {
        self.name = name
    }
    
    func prepare() {
        // abstract
    }
    
    func bake() {
        print("Bake for 25 minutes at 350")
    }
    
    func cut() {
        print("Cutting the pizza into diagonal slices")
    }
    
    func box() {
        print("Place pizza in official PizzaStore box")
    }

}

extension Pizza: CustomStringConvertible {
    
    public var description: String {
        var desc = "---- \(name) ----\n"
        
        if let dough = self.dough {
            desc += "\(dough)\n"
        }
        if let sauce = self.sauce {
            desc += "\(sauce)\n"
        }
        if let cheese = self.cheese {
            desc += "\(cheese)\n"
        }
        if veggies.count > 0 {
            for index in 0..<veggies.count {
                desc += "\(veggies[index])"
                if index < veggies.count - 1 {
                    desc += ", "
                }
            }
            desc += "\n"
        }
        if let clams = self.clams {
            desc += "\(clams)\n"
        }
        if let pepperoni = pepperoni {
            desc += "\(pepperoni)\n"
        }
        return desc
    }
}

class CheesePizza: Pizza {
    let ingredientFactory: PizzaIngredientFactory
    
    init(_ name: String, _ ingredientFactory: PizzaIngredientFactory) {
        self.ingredientFactory = ingredientFactory
        super.init(name)
    }
    
    override func prepare() {
        print("Preparing \(name)")
        dough = ingredientFactory.makeDough()
        sauce = ingredientFactory.makeSauce()
        cheese = ingredientFactory.makeCheese()
    }
}

class ClamPizza: Pizza {
    let ingredientFactory: PizzaIngredientFactory
    
    init(_ name: String, _ ingredientFactory: PizzaIngredientFactory) {
        self.ingredientFactory = ingredientFactory
        super.init(name)
    }
    
    override func prepare() {
        print("Preparing \(name)")
        dough = ingredientFactory.makeDough()
        sauce = ingredientFactory.makeSauce()
        cheese = ingredientFactory.makeCheese()
        clams = ingredientFactory.makeClams()
    }
    
}

//: Revisiting our pizza stores

protocol PizzaStore {
    func orderPizza(_ type: String) -> Pizza
    func makePizza(_ type: String) -> Pizza
}

extension PizzaStore {
    
    func orderPizza(_ type: String) -> Pizza {
        let pizza = makePizza(type)
        pizza.prepare()
        pizza.bake()
        pizza.cut()
        pizza.box()
        return pizza
    }
}

class NYPizzaStore: PizzaStore {
    
    func makePizza(_ type: String) -> Pizza {
        var pizza: Pizza! = nil
        
        let ingredientFactory = NYPizzaIngredientFactory()
        if type == "cheese" {
            pizza = CheesePizza("New York Style Cheese Pizza", ingredientFactory)
        } else if type == "clam" {
            pizza = ClamPizza("New York Style Clam Pizza", ingredientFactory)
        }
        // else etc.
        
        return pizza
    }
}

class ChicagoPizzaStore: PizzaStore {
    
    func makePizza(_ type: String) -> Pizza {
        var pizza: Pizza! = nil
        
        let ingredientFactory = ChicagoPizzaIngredientFactory()
        if type == "cheese" {
            pizza = CheesePizza("Chicago Style Cheese Pizza", ingredientFactory)
        } else if type == "clam" {
            pizza = ClamPizza("Chicago Style Clam Pizza", ingredientFactory)
        }
        // else etc.
        
        return pizza
    }
}

//: More pizza for Ethan and Joel...

let nyStore = NYPizzaStore()
let chicagoStore = ChicagoPizzaStore()

var pizza = nyStore.orderPizza("cheese")
print("Ethan ordered a \(pizza)")
pizza = chicagoStore.orderPizza("cheese")
print("Joel ordered a \(pizza)")

//: [Next](@next)
