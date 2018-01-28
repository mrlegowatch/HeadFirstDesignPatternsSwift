//
//  MallardDuck.swift
//  Adapter Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/9/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

// Simple implementations: the duck just prints what it's doing.
public class MallardDuck: Duck {
    
    public init() { }
    
    public func quack() {
        print("Quack")
    }
    
    public func fly() {
        print("I'm flying")
    }
    
}
