//
//  MallardDuck.swift
//  Strategy Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 12/28/17.
//  Copyright © 2017 Brian Arnold. All rights reserved.
//

public class MallardDuck: Duck {
    
    // A MallardDuck uses the Quack class to handle its quack, so when performQuack() is called, the responsibility for the quack is delegated to the Quack object and we get a real quack.
    // And it uses FlyWithWings as its FlyBehavior type.
    // Remember, MallardDuck inherits the quackBehavior and flyBehavior instance variables from class Duck.
    public init() {
        super.init(flyBehavior: FlyWithWings(), quackBehavior: Quack())
    }
    
    public override func display() {
        print("I'm a real Mallard duck")
    }
}
