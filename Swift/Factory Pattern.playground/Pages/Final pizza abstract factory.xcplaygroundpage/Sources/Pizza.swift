//
//  Pizza.swift
//  Factory Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/1/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

open class Pizza {
    public let name: String
    public let dough: String
    public let sauce: String
    public let toppings: [String]
    
    public init(_ name: String, dough: String, sauce: String, toppings: [String]) {
        self.name = name
        self.dough = dough
        self.sauce = sauce
        self.toppings = toppings
    }
    
    public func prepare() {
        print("Preparing \(name)")
        print("Tossing dough...")
        print("Adding sauce...")
        print("Adding toppings:")
        for topping in toppings {
            print("   \(topping)")
        }
    }
    
    public func bake() {
        print("Bake for 25 minutes at 350")
    }
    
    public func cut() {
        print("Cutting the pizza into diagonal slices")
    }
    
    public func box() {
        print("Place pizza in offical PizzaStore box")
    }
}
