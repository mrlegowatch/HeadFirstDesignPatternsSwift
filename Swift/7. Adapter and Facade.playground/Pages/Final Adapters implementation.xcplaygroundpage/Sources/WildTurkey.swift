//
//  WildTurkey.swift
//  Adapter Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/9/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class WildTurkey: Turkey {
    
    public init() { }
    
    public func gobble() {
        print("Gobble gobble")
    }
    
    public func fly() {
        print("I'm flying a short distance")
    }
}
