//
//  FlyNoWay.swift
//  Strategy Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 12/28/17.
//  Copyright © 2017 Brian Arnold. All rights reserved.
//

// And here's the implementation for all ducks that can't fly.
public class FlyNoWay: FlyBehavior {
    
    public init() { }
    
    public func fly() {
        print("I can't fly!")
    }
}
