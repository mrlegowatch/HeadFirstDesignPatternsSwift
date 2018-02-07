//
//  CeilingFan.swift
//  Command Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/4/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class CeilingFan {
    private let location: String
    
    // IN SWIFT: Use an enum rather than individual int constants.
    public enum Speed {
        case off
        case low
        case medium
        case high
    }
    
    // Notice that the CielingFan class holds local state representing the speed of the ceiling fan.
    public var speed: Speed = .off {
        // IN SWIFT: the setter replaces all of the methods to set the speed of the ceiling fan.
        // IN SWIFT: the getter substitutes for getSpeed().
        // IN SWIFT: didSet handles printing the current state.
        didSet {
            print("\(self)")
        }
    }
    
    public init(_ location: String) {
        self.location = location
    }
}

extension CeilingFan: CustomStringConvertible {
    
    public var description: String {
        let isOn = (speed != .off)
        let state = isOn ? "on \(speed)" : "off"
        return "\(location) Ceiling Fan is \(state)"
    }
}
