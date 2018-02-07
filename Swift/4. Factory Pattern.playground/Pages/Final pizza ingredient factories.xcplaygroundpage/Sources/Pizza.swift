//
//  Pizza.swift
//  Factory Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/1/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class Pizza {
    public let name: String
    
    public var dough: Dough?
    public var sauce: Sauce?
    public var veggies: [Veggie] = []
    public var cheese: Cheese?
    public var pepperoni: Pepperoni?
    public var clams: Clams?
    
    public init(_ name: String) {
        self.name = name
    }
    
    public func prepare() {
        // abstract
    }
    
    public func bake() {
        print("Bake for 25 minutes at 350")
    }
    
    public func cut() {
        print("Cutting the pizza into diagonal slices")
    }
    
    public func box() {
        print("Place pizza in official PizzaStore box")
    }
    
}

extension Pizza: CustomStringConvertible {
    
    public var description: String {
        var desc = "---- \(name) ----\n"
        
        if let dough = self.dough {
            desc += "\(dough)\n"
        }
        if let sauce = self.sauce {
            desc += "\(sauce)\n"
        }
        if let cheese = self.cheese {
            desc += "\(cheese)\n"
        }
        if veggies.count > 0 {
            for index in 0..<veggies.count {
                desc += "\(veggies[index])"
                if index < veggies.count - 1 {
                    desc += ", "
                }
            }
            desc += "\n"
        }
        if let clams = self.clams {
            desc += "\(clams)\n"
        }
        if let pepperoni = pepperoni {
            desc += "\(pepperoni)\n"
        }
        return desc
    }
}
