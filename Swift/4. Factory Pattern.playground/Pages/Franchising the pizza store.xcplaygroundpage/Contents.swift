//: [Previous](@previous)
//: ## Franchising the pizza store

protocol Pizza {
    func prepare()
    func bake()
    func cut()
    func box()
}

// PizzaStore is now abstract (see why below)
protocol PizzaStore {
    
    func orderPizza(_ type: String) -> Pizza
    
    // Now we've moved our factory object to this method.
    // Our "factory method" is now abstract in PizzaStore.
    func makePizza(_ type: String) -> Pizza
    
}

// IN SWIFT: We can implement a partially abstract base class by defining an extension to a protocol that implements one or more of the methods of that protocol. The compiler will use these methods for any subclass that doesn't provide its own implementations.
extension PizzaStore {
    
    func orderPizza(_ type: String) -> Pizza {
        // Now makePizza() is back to being a call to a method in the PizzaStore rather than a factory object.
        let pizza = makePizza(type)
        
        // All this looks just the same.
        pizza.prepare()
        pizza.bake()
        pizza.cut()
        pizza.box()
        
        return pizza
    }
}

// New York style

class NYStyleCheesePizza: Pizza {
    func prepare() { }
    func bake() { }
    func cut() { }
    func box() { }
}

class NYStylePepperoniPizza: Pizza {
    func prepare() { }
    func bake() { }
    func cut() { }
    func box() { }
}

class NYStyleClamPizza: Pizza {
    func prepare() { }
    func bake() { }
    func cut() { }
    func box() { }
}

class NYStyleVeggiePizza: Pizza {
    func prepare() { }
    func bake() { }
    func cut() { }
    func box() { }
}

//: Let's make a PizzaStore

// makePizza() returns a Pizza, and the subclass is fully responsible for which concrete Pizza it instantiates.
// The NYPizzaStore does not provide an orderPizza() method, so it inherits the orderPizza() method from PizzaStore.
class NYPizzaStore: PizzaStore {
    
    // We've got to implement makePizza() since it is abstract in PizzaStore.
    func makePizza(_ type: String) -> Pizza {
        var pizza: Pizza! = nil

        // Here's where we creat our concrete classes. For each type of Pizza we make the NY style.
        if type == "cheese" {
            pizza = NYStyleCheesePizza()
        } else if type == "pepperoni" {
            pizza = NYStylePepperoniPizza()
        } else if type == "clam" {
            pizza = NYStyleClamPizza()
        } else if type == "veggie" {
            pizza = NYStyleVeggiePizza()
        }
        return pizza
    }
}

// Chicago style

class ChicagoStyleCheesePizza: Pizza {
    func prepare() { }
    func bake() { }
    func cut() { }
    func box() { }
}

class ChicagoStylePepperoniPizza: Pizza {
    func prepare() { }
    func bake() { }
    func cut() { }
    func box() { }
}

class ChicagoStyleClamPizza: Pizza {
    func prepare() { }
    func bake() { }
    func cut() { }
    func box() { }
}

class ChicagoStyleVeggiePizza: Pizza {
    func prepare() { }
    func bake() { }
    func cut() { }
    func box() { }
}

class ChicagoPizzaStore: PizzaStore {
    
    func makePizza(_ type: String) -> Pizza {
        var pizza: Pizza! = nil
        
        if type == "cheese" {
            pizza = ChicagoStyleCheesePizza()
        } else if type == "pepperoni" {
            pizza = ChicagoStylePepperoniPizza()
        } else if type == "clam" {
            pizza = ChicagoStyleClamPizza()
        } else if type == "veggie" {
            pizza = ChicagoStyleVeggiePizza()
        }
        return pizza
    }
}

//: Behind the scenes

let nyPizzaStore = NYPizzaStore()

nyPizzaStore.orderPizza("cheese")




//: [Next](@next)
