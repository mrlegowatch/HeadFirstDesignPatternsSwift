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
        
        let ingredientFactory = NYPizzaIngredientFactory()
        if type == "cheese" {
            pizza = CheesePizza("New York Style Cheese Pizza", ingredientFactory)
        } else if type == "veggie" {
            pizza = VeggiePizza("New York Style Veggie Pizza", ingredientFactory)
        }else if type == "clam" {
            pizza = ClamPizza("New York Style Clam Pizza", ingredientFactory)
        } else if type == "pepperoni" {
            pizza = PepperoniPizza("New York Style Pepperoni Pizza", ingredientFactory)
        }
        
        return pizza
    }
}
