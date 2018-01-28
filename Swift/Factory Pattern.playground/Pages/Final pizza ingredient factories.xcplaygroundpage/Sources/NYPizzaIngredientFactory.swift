//
//  NYPizzaIngredientFactory.swift
//  Factory Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/1/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class NYPizzaIngredientFactory: PizzaIngredientFactory {
    
    public func makeDough() -> Dough {
        return ThinCrustDough()
    }
    
    public func makeSauce() -> Sauce {
        return MarinaraSauce()
    }
    
    public func makeCheese() -> Cheese {
        return ReggianoCheese()
    }
    
    public func makeVeggies() -> [Veggie] {
        return [Garlic(), Onion(), Mushroom(), RedPepper()]
    }
    
    public func makePepperoni() -> Pepperoni {
        return SlicedPepperoni()
    }
    
    public func makeClams() -> Clams {
        return FreshClams()
    }
    
}
