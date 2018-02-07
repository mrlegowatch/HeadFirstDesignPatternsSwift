//
//  Turkey.swift
//  Adapter Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/9/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public protocol Turkey {
    // Turkeys don't quack, they gobble.
    func gobble()
    // Turkeys can fly, although they can only fly short distances
    func fly()
}
