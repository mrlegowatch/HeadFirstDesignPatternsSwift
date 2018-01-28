//
//  Soy.swift
//  Decorator Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 12/29/17.
//  Copyright © 2017 Brian Arnold. All rights reserved.
//

public class Soy: CondimentDecorator {
    
    public init(_ beverage: Beverage) {
        super.init(beverage, "Soy")
    }
    
    public override func cost() -> Double {
        var cost = beverage.cost()
        
        switch beverage.size {
        case .tall:
            cost += 0.10
        case .grande:
            cost += 0.15
        case .venti:
            cost += 0.20
        }
    
        return cost
    }
}
