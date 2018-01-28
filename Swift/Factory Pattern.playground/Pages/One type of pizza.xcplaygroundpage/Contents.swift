//: # Chapter 4: The Factory Pattern
//:
//: Comments are from the Head First Design Patterns book.
//:
//: Where Swift deviates from the book, the annotation "IN SWIFT" is used in the comment.
//:
//: ## Identifying the aspects that vary

// Concrete class
class Pizza {
    func prepare() { }
    func bake() { }
    func cut() { }
    func box() { }
}

func orderPizza() -> Pizza {
    // For flexibility, we really want this to be an abstract class or interface, but we can't directly instantiate either of those.
    let pizza = Pizza()
    
    pizza.prepare()
    pizza.bake()
    pizza.cut()
    pizza.box()
    
    return pizza
}

//: [Next](@next)
