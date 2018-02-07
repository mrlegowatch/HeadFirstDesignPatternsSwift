//
//  DecoyDuck.swift
//  Strategy Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 12/28/17.
//  Copyright © 2017 Brian Arnold. All rights reserved.
//

public class DecoyDuck: Duck {
    
    public init() {
        super.init(flyBehavior: FlyNoWay(), quackBehavior: MuteQuack())
    }
    
    public override func display() {
        print("I'm just a Decoy duck")
    }
}
