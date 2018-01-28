//
//  Stereo.swift
//  Command Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/4/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

// IN SWIFT: This deviates bit from the book, since the book was ambiguous about this implementation. The state, device and volume are all implemented as enums.
public class Stereo {
    private let location: String
    
    public init(_ location: String) {
        self.location = location
    }
    
    public enum State {
        case off
        case on
    }
    
    public var state: State = .off {
        didSet {
            print("\(location) Stereo is \(state)")
        }
    }
    
    public enum Device {
        case CD
        case DVD
        case radio
    }
    
    public var device: Device = .CD {
        didSet {
            print("\(location) Stereo is set to \(device)")
        }
    }
    
    public enum Volume {
        case muted
        case on(Int)
        
        init?(level: Int) {
            // This stereo goes to 11.
            guard (0...11).contains(level) else { return nil }
            switch level {
            case 0:
                self = .muted
            default:
                self = .on(level)
            }
        }
    }
    
    public var volume: Volume = .on(4) {
        didSet {
            print("\(location) Stereo volume level is set to \(volume)")
        }
    }
    
}

extension Stereo.Volume: CustomStringConvertible {
    
    public var description: String {
        let value: String
        switch self {
        case .muted:
            value = "muted"
        case .on(let level):
            value = "\(level)"
        }
        return value
    }
}

extension Stereo: CustomStringConvertible {
    
    public var description: String {
        return "\(location) Stereo is playing \(device) at volume level set to \(volume)"
    }
}
