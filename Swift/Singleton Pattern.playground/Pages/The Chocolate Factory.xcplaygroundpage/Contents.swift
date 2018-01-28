//: # Chapter 5: The Singleton Pattern
//:
//: Comments are from the Head First Design Patterns book.
//:
//: Where Swift deviates from the book, the annotation "IN SWIFT" is used in the comment.
//:
//: ## The Chocolate Factory

class ChocolateBoiler {
    var isEmpty: Bool
    var isBoiled: Bool
    
    init() {
        // This code only started when the boiler is empty!
        isEmpty = false
        isBoiled = false
    }
    
    func fill() {
        // To fill the boiler, it must be empty, and once it's full, we set the empty and boiled flags.
        if isEmpty {
            isEmpty = false
            isBoiled = false
            // fill the boiler with a milk/chocolate mixture
        }
    }
    
    func drain() {
        // To drain the boiler, it must be full (non-empty) and also boiled. Once it is drained we set empty back to true.
        if !isEmpty && isBoiled {
            // drain the boiled milk and chocolate
            isEmpty = true
        }
    }
    
    func boil() {
        // To boil the mixture, the boiler has to be full and not already boiled. Once it's boiled we set the boiled flag to true.
        if !isEmpty && !isBoiled {
            // bring the contents to a boil
            isBoiled = true
        }
    }
}

//: [Next](@next)
