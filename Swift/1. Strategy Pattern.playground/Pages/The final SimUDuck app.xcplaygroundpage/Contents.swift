//: [Previous](@previous)
//:
//: # The final SimUDuck app
//:
//: The final SimUDuck implementation places the relevant code in source files, and the playground takes the role of just running the test.

let mallard = MallardDuck()
mallard.display()
mallard.swim()
mallard.performQuack()
mallard.performFly()

print()

let redHead = RedHeadDuck()
redHead.display()
redHead.swim()
redHead.performQuack()
redHead.performFly()

print()

let decoy = DecoyDuck()
decoy.display()
decoy.swim()
decoy.performQuack()
decoy.performFly()

print()

let rubberDuckie = RubberDuck()
rubberDuckie.display()
rubberDuckie.swim()
rubberDuckie.performQuack()
rubberDuckie.performFly()

print()

let model = ModelDuck()
model.display()
model.swim()
model.performQuack()
// First call to performFly() delegates to the flyBehavior object set in the ModelDuck's constructor, which is a FlyNoWay instance.
model.performFly()
// This invokes the model's inherited behavior setter method, and... voilà! The model suddenly has rocket-powered flying capability!
model.flyBehavior = FlyRocketPowered()
// If it worked, the model duck dynamically changed its flying behavior! You can't do THAT if the implementation lives inside the Duck class.
model.performFly()

//: [Next](@next)
