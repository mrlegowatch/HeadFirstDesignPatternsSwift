//: [Previous](@previous)
//: # Setting behavior dynamically

// Repeating the fly and quack behaviors from the previous section, for reuse in this section.

protocol FlyBehavior {
    func fly()
}

class FlyWithWings: FlyBehavior {
    func fly() {
        print("I'm flying!")
    }
}

class FlyNoWay: FlyBehavior {
    func fly() {
        print("I can't fly!")
    }
}

protocol QuackBehavior {
    func quack()
}

class Quack: QuackBehavior {
    func quack() {
        print("Quack")
    }
}

class Squeak: QuackBehavior {
    func quack() {
        print("Squeak")
    }
}

class MuteQuack: QuackBehavior {
    func quack() {
        print("<< Silence >>")
    }
}

//: 1. Add two new methods to the Duck class.

// IN SWIFT: the behavior properties were changed from let to var. We didn't provide set<Fly|Quack>Behavior() methods, because variable properties come with setters.
class Duck {
    var flyBehavior: FlyBehavior
    var quackBehavior: QuackBehavior
    
    init(flyBehavior: FlyBehavior, quackBehavior: QuackBehavior) {
        self.flyBehavior = flyBehavior
        self.quackBehavior = quackBehavior
    }
    
    func performQuack() {
        quackBehavior.quack()
    }
    
    func swim() {
        print("All ducks float, even decoys!")
    }
    
    /* abstract */ func display() {
        print("display() MUST BE OVERRIDDEN")
    }
    
    func performFly() {
        flyBehavior.fly()
    }
}

//: 2. Make a new Duck type

class ModelDuck: Duck {
    init() {
        // Our model duck begins life grounded, without a way to fly.
        super.init(flyBehavior: FlyNoWay(), quackBehavior: Quack())
    }
    
    override func display() {
        print("I'm a model duck")
    }
}

//: 3. Make a new FlyBehavior type

// That's okay, we're creating a rocket-powered flying behavior.
class FlyRocketPowered: FlyBehavior {
    func fly() {
        print("I'm flying with a rocket!")
    }
}

//: 4. Change the test class, add the ModelDuck, and make the ModelDuck rocket-enabled.

let model = ModelDuck()
model.display()
// First call to performFly() delegates to the flyBehavior object set in the ModelDuck's constructor, which is a FlyNoWay instance.
model.performFly()
// This invokes the model's inherited behavior setter method, and... voilà! The model suddenly has rocket-powered flying capability!
model.flyBehavior = FlyRocketPowered()
// If it worked, the model duck dynamically changed its flying behavior! You can't do THAT if the implementation lives inside the Duck class.
model.performFly()

//: [Next](@next)
