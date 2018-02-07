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
        if type == "cheese" {
            pizza = ChicagoStyleCheesePizza()
            } else if type == "pepperoni" {
                pizza = ChicagoStylePepperoniPizza()
            } else if type == "clam" {
                pizza = ChicagoStyleClamPizza()
            } else if type == "veggie" {
                pizza = ChicagoStyleVeggiePizza()
        }
        return pizza
    }
}
