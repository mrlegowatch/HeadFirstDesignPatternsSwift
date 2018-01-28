//: [Previous](@previous)
//: ## Encapsulating object creation

// Bringing the protocol and pizzas from the previous section forward for reuse in this section:

protocol Pizza {
    func prepare()
    func bake()
    func cut()
    func box()
}

class CheesePizza: Pizza {
    func prepare() { }
    func bake() { }
    func cut() { }
    func box() { }
}

class PepperoniPizza: Pizza {
    func prepare() { }
    func bake() { }
    func cut() { }
    func box() { }
}

class ClamPizza: Pizza {
    func prepare() { }
    func bake() { }
    func cut() { }
    func box() { }
}

class VeggiePizza: Pizza {
    func prepare() { }
    func bake() { }
    func cut() { }
    func box() { }
}

//: ## Building a simple pizza factory

// Here's our new class, SimplePizzaFactory. It has one job in life, creating pizzas for its clients.
class SimplePizzaFactory {
    
    // First we define a createPizza method in the factory. This is the method all clients will use to instantiate new objects.
    // IN SWIFT: follow Swift API guidelines, use the term "make" for factory methods, see https://swift.org/documentation/api-design-guidelines/
    func makePizza(_ type: String) -> Pizza {
        var pizza: Pizza! = nil

        // Here's the code we picked out of the orderPizza() method.
        // This code is still parameterized by the type of the pizza, just like our original orderPizza() method was.
        if type == "cheese" {
            pizza = CheesePizza()
        } else if type == "pepperoni" {
            pizza = PepperoniPizza()
        } else if type == "clam" {
            pizza = ClamPizza()
        } else if type == "veggie" {
            pizza = VeggiePizza()
        }
        return pizza
    }
}

//: Reworking the PizzaStore class

class PizzaStore {
    // Now we give PizzaStore a reference to a SimpleFactory.
    let factory: SimplePizzaFactory
    
    // PizzaStore gets the factory passed into it in the constructor.
    init(_ factory: SimplePizzaFactory) {
        self.factory = factory
    }
    
    func orderPizza(_ type: String) -> Pizza {
        // Notice that we've replaced the pizza creation with a create method on the factory object. No more concrete instantiations here!
        // And the orderPizza() method uses the factory to create its pizzas by passing the type of the order.
        let pizza = factory.makePizza(type)
        
        pizza.prepare()
        pizza.bake()
        pizza.cut()
        pizza.box()
        
        return pizza
    }
    
    // Other methods here
}

//: [Next](@next)
