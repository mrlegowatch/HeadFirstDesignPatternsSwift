//
//  GarageDoor.swift
//  Command Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/4/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class GarageDoor {
    private let location: String
    
    public init(_ location: String) {
        self.location = location
    }

    public func up() {
        print("\(location) Garage Door is opened.")

    }
    
    public func down() {
        print("\(location) Garage Door is closed.")
    }
}
