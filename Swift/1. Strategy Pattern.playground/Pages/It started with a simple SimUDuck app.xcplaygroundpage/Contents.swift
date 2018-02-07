//: # Chapter 1: The Strategy Pattern
//:
//: Comments are from the Head First Design Patterns book.
//:
//: Where Swift deviates from the book, the annotation "IN SWIFT" is used in the comment.
//:
//: ## It started with a simple SimUDuck app

protocol Duck {
    func quack()
    
    func swim()
    
    // The display() method is abstract, since all duck subtypes look different.
    // Each duck subtype is responsible for implementing its own display() behavior for how it looks on the screen.
    func display()
}

// All ducks quack and swim. The superclass takes care of the implementation code.
// IN SWIFT: use a protocol with an extension, instead of a base class.
extension Duck {
    func quack() {
        print("Quacking")
    }
    
    func swim() {
        print("Swimming")
    }
}

class MallardDuck: Duck {
    func display() {
        print("Looks like a Mallard")
    }
}

class RedHeadDuck: Duck {
    func display() {
        print("Looks like a Redhead")
    }
}


//: ## But now we need the ducks to FLY

/*

protocol Duck {
    ...
    // What Joe added.
    // All subclasses inherit fly().
    func fly()
}
 
 */

// By putting fly() in the superclass, he'd give the ability to ALL ducks, including those that shouldn't.


//: ## But something went horribly wrong...

class RubberDuck: Duck {
    func display() {
        print("Looks like a RubberDuck")
    }
    
    // Rubber ducks don't quack, so quack() is overridden to "squeak".
    /*
    func quack() {
        // overridden to Squeak
    }
    */
}

//: ## Joe thinks about inheritance...

// The RubberDuck would need to override fly() to do nothing.

/*
 
class RubberDuck: Duck {
    ...
    func fly() {
        // override to do nothing
    }
}
 
 */


//: [Next](@next)
