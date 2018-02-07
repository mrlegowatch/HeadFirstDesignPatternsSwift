//: [Previous](@previous)
//: ## We're just missing one thing: PIZZA!

// IN SWIFT: The book declares an abstract class, but it implements all of its properties and methods; we will specify a base class, and pass initial property values into its init() method, due to the storage requirements used in this example.
class Pizza {
    let name: String
    let dough: String
    let sauce: String
    let toppings: [String]
    
    init(_ name: String, dough: String, sauce: String, toppings: [String]) {
        self.name = name
        self.dough = dough
        self.sauce = sauce
        self.toppings = toppings
    }
    
    func prepare() {
        print("Preparing \(name)")
        print("Tossing dough...")
        print("Adding sauce...")
        print("Adding toppings:")
        for topping in toppings {
            print("   \(topping)")
        }
    }
    
    func bake() {
        print("Bake for 25 minutes at 350")
    }
    
    func cut() {
        print("Cutting the pizza into diagonal slices")
    }
    
    func box() {
        print("Place pizza in offical PizzaStore box")
    }
}

class NYStyleCheesePizza: Pizza {
    init() {
        // The NY Style Pizza has its own marinara style sauce and thin crust.
        // And one topping, reggiano cheese!
        super.init("NY Style Sauce and Cheese Pizza", dough: "Thin Crust Dough", sauce: "Marinara Sauce", toppings: ["Grated Reggiano Cheese"])
    }
}

class ChicagoStyleCheesePizza: Pizza {
    init() {
        // The Chicago Style Pizza uses plum tomatoes as a sauce along with extra-thick crust.
        // The Chicago Style deep dish pizza has lots of mozarella cheese!
        super.init("Chicago Style Deep Dish Cheese Pizza", dough: "Extra Thick Crust Dough", sauce: "Plum Tomato Sauce", toppings: ["Shredded Mozarella Cheese"])
    }
    
    // The Chicago style pizza also overrides the cut() method so that pieces are cut into squares.
    override func cut() {
        print("Cutting the pizza into square slices")
    }
}

//: Pizza test drive

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
        
        if type == "cheese" {
            pizza = NYStyleCheesePizza()
        //} else if type == "pepperoni" {
        //    pizza = NYStylePepperoniPizza()
        //} else if type == "clam" {
        //    pizza = NYStyleClamPizza()
        //} else if type == "veggie" {
        //    pizza = NYStyleVeggiePizza()
        }
        return pizza
    }
}

class ChicagoPizzaStore: PizzaStore {
    
    func makePizza(_ type: String) -> Pizza {
        var pizza: Pizza! = nil
        if type == "cheese" {
            pizza = ChicagoStyleCheesePizza()
        //} else if type == "pepperoni" {
        //    pizza = ChicagoStylePepperoniPizza()
        //} else if type == "clam" {
        //    pizza = ChicagoStyleClamPizza()
        //} else if type == "veggie" {
        //    pizza = ChicagoStyleVeggiePizza()
        }
        return pizza
    }
}

//: ## You've waited long enough. Time for some pizzas!

let nyStore = NYPizzaStore()
let chicagoStore = ChicagoPizzaStore()

var pizza = nyStore.orderPizza("cheese")
print("Ethan ordered a \(pizza.name)")
pizza = chicagoStore.orderPizza("cheese")
print("Joel ordered a \(pizza.name)")


//: [Next](@next)
