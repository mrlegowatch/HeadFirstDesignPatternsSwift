//
//  DuckAdapter.swift
//  Adapter Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/9/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

// Now we are adapting Turkeys to Ducks, so we implement the Turkey interface.
public class DuckAdapter: Turkey {
    // We stash a reference to the Duck we are adapting.
    private let duck: Duck
    
    // We also create a random objct; take a look at the fly() method to see how it is used.
    private let random: Random
    
    public init(_ duck: Duck) {
        self.duck = duck
        random = Random()
    }
    
    public func gobble() {
        // A gobble just becomes a quack.
        duck.quack()
    }
    
    public func fly() {
        // Since Ducks fly a lot longer than Turkeys, we decided to only fly the Duck on average one of five times.
        if random.nextInt(5) == 0 {
            duck.fly()
        }
    }
}
