//: [Previous](@previous)
//: # But the pressure is on to add more pizza types...

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

// REMOVING:
//class GreekPizza: Pizza {
//    func prepare() { }
//    func bake() { }
//    func cut() { }
//    func box() { }
//}

class PepperoniPizza: Pizza {
    func prepare() { }
    func bake() { }
    func cut() { }
    func box() { }
}

// ADDING:
class ClamPizza: Pizza {
    func prepare() { }
    func bake() { }
    func cut() { }
    func box() { }
}

// ADDING:
class VeggiePizza: Pizza {
    func prepare() { }
    func bake() { }
    func cut() { }
    func box() { }
}

// We're now passing in the type of pizza to orderPizza.
func orderPizza(_ type: String) -> Pizza {
    var pizza: Pizza! = nil
    
    // This is what varies. As the pizza selection changes over time, you'll have to modify this code over and over.
     // This code is NOT closed for modification. If the Pizza Shop changes its pizza offerings, we have to get into this code and modify it.
    if type == "cheese" {
        pizza = CheesePizza()
    // REMOVING:
    //} else if type == "greek" {
    //    pizza = GreekPizza()
    } else if type == "pepperoni" {
        pizza = PepperoniPizza()
    } else if type == "clam" { // ADDING:
        pizza = ClamPizza()
    } else if type == "veggie" { // ADDING:
        pizza = VeggiePizza()
    }
    
    // This is what we expect to stay the same. For the most part, preparing, cooking, and packaging a pizza has remained the same for years and years. So, we don't expect this code to change, just the pizzas it operates on.
    pizza.prepare()
    pizza.bake()
    pizza.cut()
    pizza.box()
    
    return pizza
}

//: [Next](@next)
