//: [Previous](@previous)
//: # How about an interface?

// IN SWIFT: We can declare protocols with default implementations to reduce duplicate code. The book instead declared interfaces without implementations, implying that there would be duplicate code. In Java, multiple interfaces can be implemented in a class, but a class cannot inherit ("extend") multiple implementations. That was one of the main points of this section of the chapter: "multiple interfaces good, multiple implementations bad (for inheritance, in Java)."

protocol Flyable {
    func fly()
}

extension Flyable {
    func fly() {
        print("Flying")
    }
}

protocol Quackable {
    func quack()
}

extension Quackable {
    func quack() {
        print("Quack")
    }
}

protocol Duck {
    func swim()
    func display()
}

extension Duck {
    func swim() {
        print("Swimming")
    }
}

class MallardDuck: Duck, Flyable, Quackable {
    func display() {
        print("Mallard")
    }
}

class RedheadDuck: Duck, Flyable, Quackable {
    func display() {
        print("Redhead")
    }
}

class RubberDuck: Duck, Quackable {
    func display() {
        print("RubberDuck")
    }
}

class DecoyDuck: Duck {
    func display() {
        print("DecoyDuck")
    }
}

//: [Next](@next)
