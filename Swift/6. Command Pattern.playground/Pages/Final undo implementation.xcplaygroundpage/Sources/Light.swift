//
//  Light.swift
//  Command Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/4/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class Light {
    private let location: String
    
    // IN SWIFT: use an enum with associated value for dim level.
    internal enum State {
        case off
        case dimmed(Int)
        case on
        
        init?(level: Int) {
            guard (0...100).contains(level) else { return nil }
            switch level {
            case 0:
                self = .off
            case 100:
                self = .on
            default:
                self = .dimmed(level)
            }
        }
    }
    
    // IN SWIFT:
    // state = .off is equivalent to off()
    // state = .on is equivalent to on()
    // state = .dimmed(Int) is equivalent to dimmed(Int)
    internal var state: State = .off {
        didSet {
            print("\(self)")
        }
    }
    
    public init(_ location: String) {
        self.location = location
    }
    
}

extension Light.State: CustomStringConvertible {
    
    public var description: String {
        let value: String
        switch self {
        case .off:
            value = "off"
        case .on:
            value = "on"
        case .dimmed(let level):
            value = "dimmed to \(level)%"
        }
        return value
    }
    
}

extension Light: CustomStringConvertible {
    
    public var description: String {
        return "\(location) Light is \(state)"
    }
    
}
