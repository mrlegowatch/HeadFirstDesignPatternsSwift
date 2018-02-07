//
//  ChicagoStyleVeggiePizza.swift
//  Factory Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/1/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class ChicagoStyleVeggiePizza: Pizza {
    public init() {
        super.init("Chicago Style Deep Dish Cheese Pizza", dough: "Extra Thick Crust Dough", sauce: "Plum Tomato Sauce", toppings: ["Shredded Mozzarella Cheese", "Black Olives", "Spinach", "Eggplant"])
    }
    
    public override func cut() {
        print("Cutting the pizza into square slices")
    }
}
