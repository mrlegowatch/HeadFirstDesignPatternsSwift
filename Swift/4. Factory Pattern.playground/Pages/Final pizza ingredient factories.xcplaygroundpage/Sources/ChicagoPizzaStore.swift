//
//  ChicagePizzaStore.swift
//  Factory Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/1/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class ChicagoPizzaStore: PizzaStore {
    
    public init() { }
    
    public func makePizza(_ type: String) -> Pizza {
        var pizza: Pizza! = nil
        
        let ingredientFactory = ChicagoPizzaIngredientFactory()
        if type == "cheese" {
            pizza = CheesePizza("Chicago Style Cheese Pizza", ingredientFactory)
        } else if type == "veggie" {
            pizza = VeggiePizza("Chicago Style Veggie Pizza", ingredientFactory)
        }else if type == "clam" {
            pizza = ClamPizza("Chicago Style Clam Pizza", ingredientFactory)
        } else if type == "pepperoni" {
            pizza = PepperoniPizza("Chicago Style Pepperoni Pizza", ingredientFactory)
        }
        
        return pizza
    }
}
