//
//  ModelDuck.swift
//  Strategy Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 12/28/17.
//  Copyright © 2017 Brian Arnold. All rights reserved.
//

public class ModelDuck: Duck {
    public init() {
        // Our model duck begins life grounded, without a way to fly.
        super.init(flyBehavior: FlyNoWay(), quackBehavior: Quack())
    }
    
    public override func display() {
        print("I'm a model duck")
    }
}
