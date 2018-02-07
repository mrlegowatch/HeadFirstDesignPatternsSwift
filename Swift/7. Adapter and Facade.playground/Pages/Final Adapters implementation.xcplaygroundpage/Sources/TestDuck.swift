//
//  TestDuck.swift
//  Adapter Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/9/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

// Here's our testDuck() method; it gets a duck and calls its quack() and fly() methods.
public func testDuck(_ duck: Duck) {
    duck.quack()
    duck.fly()
}
