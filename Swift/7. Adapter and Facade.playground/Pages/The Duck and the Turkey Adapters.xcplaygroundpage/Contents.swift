//: # Chapter 7: The Adapter and Facade Patterns
//:
//: Comments are from the Head First Design Patterns book.
//:
//: Where Swift deviates from the book, the annotation "IN SWIFT" is used in the comment.
//:
//: ## Duck and Turkey

// This time around, our ducks implement a Duck interface that allows Ducks to quack and fly.
protocol Duck {
    func quack()
    func fly()
}

// Simple implementations: the duck just prints what it's doing.
class MallardDuck: Duck {
    
    func quack() {
        print("Quack")
    }
    
    func fly() {
        print("I'm flying")
    }
    
}

protocol Turkey {
    // Turkeys don't quack, they gobble.
    func gobble()
    // Turkeys can fly, although they can only fly short distances
    func fly()
}

class WildTurkey: Turkey {
    
    func gobble() {
        print("Gobble gobble")
    }
    
    func fly() {
        print("I'm flying a short distance")
    }
}

// First, you need to implement the interface of the type you're adapting to. This is the interface your client expects to see.
class TurkeyAdapter: Duck {
    let turkey: Turkey
    
    // Next, we need to get a reference to the object that we are adapting; heer we do that through the constructor.
    init(_ turkey: Turkey) {
        self.turkey = turkey
    }
    
    // Now we need to implement all the methods in the interface; the quack() translation between classes is easy: just call the gobble() method.
    func quack() {
        turkey.gobble()
    }
    
    // Even though both interfaces have a fly() method, turkeys fly in short spurts--they can't do long-distance flying like ducks. To map between a Duck's fly() method and a Turkey's, we need to call the Turkey's fly() method five times to make up for it.
    func fly() {
        for _ in 0..<5 {
            turkey.fly()
        }
    }
}

//: Test drive the adapter

// Here's our testDuck() method; it gets a duck and calls its quack() and fly() methods.
func testDuck(_ duck: Duck) {
    duck.quack()
    duck.fly()
}

// Let's create a duck and a turkey.
let duck = MallardDuck()
let turkey = WildTurkey()

// And then wrap the turkey in a TurkeyAdapter, which makes it look like a duck.
let turkeyAdapter = TurkeyAdapter(turkey)

// Then, let's test the Turkey: make it gobble, make it fly.
print("The Turkey says...")
turkey.gobble()
turkey.fly()

// Now let's test the duck by calling the testDuck() method, which expects a Duck object.
print("\nThe Duck says...")
testDuck(duck)

// Now the big test: we try to pass off the turkey as a duck...
print("\nThe TurkeyAdapter says...")
testDuck(turkeyAdapter)

//: Sharpen your pencil
//:
//: Let's say we also need an Adapter that converts a Duck to a Turkey. Let's call it DuckAdapter. Write that class.

// IN SWIFT: See Random.swift attached to this playground page.

// Now we are adapting Turkeys to Ducks, so we implement the Turkey interface.
class DuckAdapter: Turkey {
    // We stash a reference to the Duck we are adapting.
    let duck: Duck
    
    // We also create a random objct; take a look at the fly() method to see how it is used.
    let random: Random
    
    init(_ duck: Duck) {
        self.duck = duck
        random = Random()
    }
    
    func gobble() {
        // A gobble just becomes a quack.
        duck.quack()
    }
    
    func fly() {
        // Since Ducks fly a lot longer than Turkeys, we decided to only fly the Duck on average one of five times.
        if random.nextInt(5) == 0 {
            duck.fly()
        }
    }
}

print("\nThe DuckAdapter says...")
let duckAdapter = DuckAdapter(duck)
duckAdapter.gobble()
duckAdapter.fly()
duckAdapter.fly()
duckAdapter.fly()
duckAdapter.fly()
duckAdapter.fly()
