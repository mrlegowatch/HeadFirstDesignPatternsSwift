//
//  FlyBehavior.swift
//  Strategy Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 12/28/17.
//  Copyright © 2017 Brian Arnold. All rights reserved.
//

/// FlyBehavior is an interface that all flying classes implement. All new flying classes just need to implement the fly() method.
public protocol FlyBehavior {
    
    func fly()
    
}
