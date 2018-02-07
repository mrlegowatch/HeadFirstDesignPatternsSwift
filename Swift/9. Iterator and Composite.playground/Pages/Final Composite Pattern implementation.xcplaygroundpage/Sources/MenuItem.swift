//
//  MenuItem.swift
//  Composite Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 2/6/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class MenuItem: MenuComponent {
    public let name: String
    public let description: String
    private let isVegetarianValue: Bool
    private let priceValue: Double
    
    public init(name: String, description: String, isVegetarian: Bool, price: Double) {
        self.name = name
        self.description = description
        self.isVegetarianValue = isVegetarian
        self.priceValue = price
    }
    
    public func price() throws -> Double {
        return priceValue
    }
    
    public func isVegetarian() throws -> Bool {
        return isVegetarianValue
    }
    
    // IN SWIFT: It's best not to name a function the same as a system function, but we did, and adding "Swift." is how you work around that.
    public func print() {
        let vegetarian = isVegetarianValue ? "(v)" : ""
        Swift.print("  \(name) \(vegetarian), \(priceValue)    -- \(description)")
    }
    
    public func makeIterator() -> AnyIterator<MenuComponent> {
        return AnyIterator(NilIterator())
    }
}
