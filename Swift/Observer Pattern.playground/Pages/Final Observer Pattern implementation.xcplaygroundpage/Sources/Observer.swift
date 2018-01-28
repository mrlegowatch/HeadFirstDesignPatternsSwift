//
//  Observer.swift
//  Observer Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/3/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//


// All our weather components implement the Observer interface. This gives the Subject a common interface to talk to when it comes time to update the observers.
public protocol Observer {
    
    func update(temperature: Double, humidity: Double, pressure: Double)
    
}
