//
//  TheaterLights.swift
//  Façade Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/9/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class TheaterLights {
    
    public init() { }
    
    public func on() {
        print("Theater Ceiling Lights on")
    }
    
    public func dim(_ percent: Int) {
        print("Theater Ceiling Lights dimming to \(percent)%")
    }
    
}
