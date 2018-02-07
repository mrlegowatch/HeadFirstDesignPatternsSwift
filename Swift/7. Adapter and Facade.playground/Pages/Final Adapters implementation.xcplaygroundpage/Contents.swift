//: [Previous](@previous)
//: # The final Adapter implementation
//:
//: The final Adapter implementation places the relevant code in source files, and the playground takes the role of just running the test.
//:

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

print("\nThe DuckAdapter says...")
let duckAdapter = DuckAdapter(duck)
duckAdapter.gobble()
duckAdapter.fly()
duckAdapter.fly()
duckAdapter.fly()
duckAdapter.fly()
duckAdapter.fly()

//: [Next](@next)
