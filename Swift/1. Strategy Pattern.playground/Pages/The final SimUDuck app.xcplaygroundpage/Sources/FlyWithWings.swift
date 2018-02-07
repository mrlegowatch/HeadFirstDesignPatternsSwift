//
//  FlyWithWings.swift
//  Strategy Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 12/28/17.
//  Copyright © 2017 Brian Arnold. All rights reserved.
//

// Here's the implementation of flying for all ducks that have wings.
public class FlyWithWings: FlyBehavior {
    
    public init() { }
    
    public func fly() {
        print("I'm flying!")
    }
}
