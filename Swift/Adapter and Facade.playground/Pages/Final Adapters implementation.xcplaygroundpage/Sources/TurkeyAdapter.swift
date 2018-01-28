//
//  TurkeyAdapter.swift
//  Adapter Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/9/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

// First, you need to implement the interface of the type you're adapting to. This is the interface your client expects to see.
public class TurkeyAdapter: Duck {
    private let turkey: Turkey
    
    // Next, we need to get a reference to the object that we are adapting; heer we do that through the constructor.
    public init(_ turkey: Turkey) {
        self.turkey = turkey
    }
    
    // Now we need to implement all the methods in the interface; the quack() translation between classes is easy: just call the gobble() method.
    public func quack() {
        turkey.gobble()
    }
    
    // Even though both interfaces have a fly() method, turkeys fly in short spurts--they can't do long-distance flying like ducks. To map between a Duck's fly() method and a Turkey's, we need to call the Turkey's fly() method five times to make up for it.
    public func fly() {
        for _ in 0..<5 {
            turkey.fly()
        }
    }
}
