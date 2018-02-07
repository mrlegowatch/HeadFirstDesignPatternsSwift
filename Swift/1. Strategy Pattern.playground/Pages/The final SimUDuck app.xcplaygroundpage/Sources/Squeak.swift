//
//  Squeak.swift
//  Strategy Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 12/28/17.
//  Copyright © 2017 Brian Arnold. All rights reserved.
//

// Quacks that really squeak.
public class Squeak: QuackBehavior {
    
    public init() { }
    
    public func quack() {
        print("Squeak")
    }
}
