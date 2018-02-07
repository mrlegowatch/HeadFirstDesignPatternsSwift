//
//  HouseBlend.swift
//  Decorator Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 12/29/17.
//  Copyright © 2017 Brian Arnold. All rights reserved.
//

public class HouseBlend: Beverage {
    public init(size: Size = .tall) {
        super.init("House Blend Coffee", size: size)
    }
    
    public override func cost() -> Double {
        let cost: Double
        switch size {
        case .tall:
            cost = 0.89
        case .grande:
            cost = 1.49
        case .venti:
            cost = 2.09
        }
        return cost
    }
}
