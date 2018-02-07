//
//  RubberDuck.swift
//  Strategy Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 12/28/17.
//  Copyright © 2017 Brian Arnold. All rights reserved.
//

public class RubberDuck: Duck {
    
    public init() {
        super.init(flyBehavior: FlyNoWay(), quackBehavior: Squeak())
    }
    
    public override func display() {
        print("I'm a rubber duckie")
    }
}
