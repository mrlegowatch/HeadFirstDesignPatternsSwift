//
//  RedHeadDuck.swift
//  Strategy Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 12/28/17.
//  Copyright © 2017 Brian Arnold. All rights reserved.
//

public class RedHeadDuck: Duck {
    
    public init() {
        super.init(flyBehavior: FlyWithWings(), quackBehavior: Quack())
    }
    
    public override func display() {
        print("I'm a real Red Headed duck")
    }
}
