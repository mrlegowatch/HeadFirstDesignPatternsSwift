//
//  HotTub.swift
//  Command Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/4/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class HotTub {
    private let location: String
    
    public init(_ location: String) {
        self.location = location
    }
    
    public func on() {
        print("\(location) Hot Tub is on")
    }
    
    public func off() {
        print("\(location) Hot Tub is off")
    }
}

