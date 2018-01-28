//
//  Beverage.swift
//  Decorator Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 12/30/17.
//  Copyright © 2017 Brian Arnold. All rights reserved.
//

open class Beverage {
    public let description: String
    
    public init(_ description: String, size: Size = .tall) {
        self.description = description
        self.size = size
    }
    
    public /* abstract */ func cost() -> Double {
        // SUBCLASSES MUST OVERRIDE
        return 0
    }
    
    public enum Size {
        case tall
        case grande
        case venti
    }
    public private(set) var size: Size
}
