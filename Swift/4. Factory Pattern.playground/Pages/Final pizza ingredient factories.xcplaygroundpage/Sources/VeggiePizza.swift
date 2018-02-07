//
//  VeggiePizza.swift
//  Factory Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/1/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class VeggiePizza: Pizza {
    let ingredientFactory: PizzaIngredientFactory
    
    public init(_ name: String, _ ingredientFactory: PizzaIngredientFactory) {
        self.ingredientFactory = ingredientFactory
        super.init(name)
    }
    
    public override func prepare() {
        print("Preparing \(name)")
        dough = ingredientFactory.makeDough()
        sauce = ingredientFactory.makeSauce()
        cheese = ingredientFactory.makeCheese()
        veggies = ingredientFactory.makeVeggies()
    }
    
}
