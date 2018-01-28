//
//  PizzaIngredientFactory.swift
//  Factory Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/1/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public protocol PizzaIngredientFactory {
    
    func makeDough() -> Dough
    func makeSauce() -> Sauce
    func makeCheese() -> Cheese
    func makeVeggies() -> [Veggie]
    func makePepperoni() -> Pepperoni
    func makeClams() -> Clams
}
