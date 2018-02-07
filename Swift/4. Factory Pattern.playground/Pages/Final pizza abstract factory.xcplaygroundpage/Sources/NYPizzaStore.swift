//
//  NYPizzaStore.swift
//  Factory Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/1/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class NYPizzaStore: PizzaStore {
    
    public init() { }
    
    public func makePizza(_ type: String) -> Pizza {
        var pizza: Pizza! = nil
        
        if type == "cheese" {
            pizza = NYStyleCheesePizza()
            } else if type == "pepperoni" {
                pizza = NYStylePepperoniPizza()
            } else if type == "clam" {
                pizza = NYStyleClamPizza()
            } else if type == "veggie" {
                pizza = NYStyleVeggiePizza()
        }
        return pizza
    }
}
