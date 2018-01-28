//: [Previous](@previous)
//: ## But you need more than one type of pizza...

// Abstract class or interface ("protocol" in Swift)
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

class GreekPizza: Pizza {
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

// We're now passing in the type of pizza to orderPizza.
func orderPizza(_ type: String) -> Pizza {
    var pizza: Pizza! = nil
    
    // Based on the type of pizza, we instantiate the correct concrete class and assign it to the pizza instance variable. Note that each pizza here has to implement the Pizza interface.
    if type == "cheese" {
        pizza = CheesePizza()
    } else if type == "greek" {
        pizza = GreekPizza()
    } else if type == "pepperoni" {
        pizza = PepperoniPizza()
    }
    
    // Once we have a Pizza, we prepare it (you know, roll the dough, put on the sauce and add the toppings & cheese) then we bake it, cut it and box it!
    // Each Pizza subtype (CheesePizza, VeggiePizza, etc.) knows how to prepare itself.
    pizza.prepare()
    pizza.bake()
    pizza.cut()
    pizza.box()
    
    return pizza
}

//: [Next](@next)
