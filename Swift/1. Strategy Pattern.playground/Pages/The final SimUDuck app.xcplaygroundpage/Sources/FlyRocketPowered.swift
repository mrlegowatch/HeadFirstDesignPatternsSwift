//
//  FlyRocketPowered.swift
//  Strategy Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 12/28/17.
//  Copyright © 2017 Brian Arnold. All rights reserved.
//

// That's okay, we're creating a rocket-powered flying behavior.
public class FlyRocketPowered: FlyBehavior {
   
    public init() { }
    
    public func fly() {
        print("I'm flying with a rocket!")
    }
}
