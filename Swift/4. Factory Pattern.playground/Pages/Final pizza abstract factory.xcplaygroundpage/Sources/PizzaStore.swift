//
//  PizzaStore.swift
//  Factory Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/1/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public protocol PizzaStore {
    func orderPizza(_ type: String) -> Pizza
    func makePizza(_ type: String) -> Pizza
}

extension PizzaStore {
    
    public func orderPizza(_ type: String) -> Pizza {
        let pizza = makePizza(type)
        pizza.prepare()
        pizza.bake()
        pizza.cut()
        pizza.box()
        return pizza
    }
}
