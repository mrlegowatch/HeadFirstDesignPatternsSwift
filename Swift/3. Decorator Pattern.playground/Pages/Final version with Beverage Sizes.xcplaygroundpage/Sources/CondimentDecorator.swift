//
//  CondimentDecorator.swift
//  Decorator Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 12/29/17.
//  Copyright © 2017 Brian Arnold. All rights reserved.
//

open class CondimentDecorator: Beverage {
    public let beverage: Beverage
    
    public init(_ beverage: Beverage, _ description: String) {
        self.beverage = beverage
        super.init(beverage.description + ", " + description)
    }
    
    public override var size: Size {
        get {
            return beverage.size
        }
    }
    
}
