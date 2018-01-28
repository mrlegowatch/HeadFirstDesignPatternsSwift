//
//  Duck.swift
//  Adapter Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/9/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

// This time around, our ducks implement a Duck interface that allows Ducks to quack and fly.
public protocol Duck {
    func quack()
    func fly()
}
