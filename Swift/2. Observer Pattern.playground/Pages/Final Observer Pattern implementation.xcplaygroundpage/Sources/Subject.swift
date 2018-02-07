//
//  Subject.swift
//  Observer Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/3/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

// Here's our subject interface. This should look familiar.
public protocol Subject {
    
    func register(observer: Observer)
    
    func remove(observer: Observer)
    
    func notifyObservers()
    
}
