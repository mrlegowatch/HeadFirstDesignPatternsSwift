//
//  Duck.swift
//  Strategy Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 12/28/17.
//  Copyright © 2017 Brian Arnold. All rights reserved.
//

// IN SWIFT: In order to implement subclasses in the playground, we declare the class and the display method as open instead of public.
open class Duck {
    // Declare two reference variables for the behavior interface types. All duck classes (in the same package) inherit these.
    public var flyBehavior: FlyBehavior
    public var quackBehavior: QuackBehavior
    
    public init(flyBehavior: FlyBehavior, quackBehavior: QuackBehavior) {
        self.flyBehavior = flyBehavior
        self.quackBehavior = quackBehavior
    }
    
    public func performQuack() {
        // Delegate to the behavior class
        quackBehavior.quack()
    }
    
    public func swim() {
        print("All ducks float, even decoys!")
    }
    
    open /* abstract */ func display() {
        // MUST BE OVERRIDDEN
        print("display() MUST BE OVERRIDDEN")
    }
    
    public func performFly() {
        // Delegate to the behavior class.
        flyBehavior.fly()
    }
}
