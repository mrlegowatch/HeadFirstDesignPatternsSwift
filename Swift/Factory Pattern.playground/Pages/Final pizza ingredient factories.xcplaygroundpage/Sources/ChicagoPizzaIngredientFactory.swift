//
//  ChicagePizzaIngredientFactory.swift
//  Factory Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/1/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class ChicagoPizzaIngredientFactory: PizzaIngredientFactory {
    
    public func makeDough() -> Dough {
        return ThickCrustDough()
    }
    
    public func makeSauce() -> Sauce {
        return PlumTomatoSauce()
    }
    
    public func makeCheese() -> Cheese {
        return MozzarellaCheese()
    }
    
    public func makeVeggies() -> [Veggie] {
        return [BlackOlives(), Spinach(), Eggplant()]
    }
    
    public func makePepperoni() -> Pepperoni {
        return SlicedPepperoni()
    }
    
    public func makeClams() -> Clams {
        return FrozenClams()
    }
    
}
