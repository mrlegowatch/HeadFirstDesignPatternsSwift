//: [Previous](@previous)
//: # Implementing the Duck Behaviors

// FlyBehavior is an interface that all flying classes implement. All new flying classes just need to implement the fly() method.
protocol FlyBehavior {
    func fly()
}

// Here's the implementation of flying for all ducks that have wings.
class FlyWithWings: FlyBehavior {
    func fly() {
        print("I'm flying!")
    }
}

// And here's the implementation for all ducks that can't fly.
class FlyNoWay: FlyBehavior {
    func fly() {
        print("I can't fly!")
    }
}

// Same thing here for the quack behavior, we have an interface that just includes a quack() method that needs to be implemented.
protocol QuackBehavior {
    func quack()
}

// Quacks that really quack.
class Quack: QuackBehavior {
    func quack() {
        print("Quack")
    }
}

// Quacks that really squeak.
class Squeak: QuackBehavior {
    func quack() {
        print("Squeak")
    }
}

// Quacks that make no sound at all.
class MuteQuack: QuackBehavior {
    func quack() {
        print("<< Silence >>")
    }
}

//: Integrating the Duck behavior

// IN SWIFT: To follow the book more closely, we implement a base class here, instead of a protocol, but Swift requires us to then provide a default implementation of display() that must be overridden in subclasses.
// IN SWIFT: to get the order of declarations right in a single playground, we had to move some bits of the Testing the Duck section up to here.
class Duck {
    // Declare two reference variables for the behavior interface types. All duck classes (in the same package) inherit these.
    let flyBehavior: FlyBehavior
    let quackBehavior: QuackBehavior
    
    // IN SWIFT: we provide a base class constructor, because the instance variables flyBehavior and quackBehavior must be initialized in the base class. (Alternatively, we could have declared them as optionals, with ? or !.) In the book, the instance variables are set in the subclass constructors. In Swift, we pass them to the base class constructor.
    init(flyBehavior: FlyBehavior, quackBehavior: QuackBehavior) {
        self.flyBehavior = flyBehavior
        self.quackBehavior = quackBehavior
    }
    
    func performQuack() {
        // Delegate to the behavior class
        quackBehavior.quack()
    }
    
    func swim() {
        print("All ducks float, even decoys!")
    }
    
    /* abstract */ func display() {
        // MUST BE OVERRIDDEN
        print("display() MUST BE OVERRIDDEN")
    }
    
    func performFly() {
        // Delegate to the behavior class.
        flyBehavior.fly()
    }
}

class MallardDuck: Duck {
    
    // A MallardDuck uses the Quack class to handle its quack, so when performQuack() is called, the responsibility for the quack is delegated to the Quack object and we get a real quack.
    // And it uses FlyWithWings as its FlyBehavior type.
    // Remember, MallardDuck inherits the quackBehavior and flyBehavior instance variables from class Duck.
    init() {
        super.init(flyBehavior: FlyWithWings(), quackBehavior: Quack())
    }
    
    override func display() {
        print("I'm a real Mallard duck")
    }
}

class DecoyDuck: Duck {
    
    init() {
        super.init(flyBehavior: FlyNoWay(), quackBehavior: MuteQuack())
    }
    
    override func display() {
        print("I'm just a Decoy duck")
    }
}

//: Testing the Duck code

// IN SWIFT: since we are writing this code in a Playground, we don't implement test or simulator classes with main() functions, and instead can execute the code directly.

let mallardDuck = MallardDuck()
mallardDuck.display()
mallardDuck.performQuack()
mallardDuck.swim()
mallardDuck.performFly()

print()

let decoyDuck = DecoyDuck()
decoyDuck.display()
decoyDuck.performQuack()
decoyDuck.swim()
decoyDuck.performFly()

//: [Next](@next)
