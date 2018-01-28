//
//  CaffeineBeverage.swift
//  Template Method Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/17/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public protocol CaffeineBeverage {
    
    func prepareRecipe()
    
    func boilWater()
    
    func pourInCup()
    
    // The methods that need to be supplied by a subclass are declared abstract.
    
    func brew()
    
    func addCondiments()
}

extension CaffeineBeverage {
    
    // prepareRecipe() is our template method. Why? Because:
    //  (1) It is a method, after all.
    //  (2) It serves as a template for an algorithm, in this case, an algorithm for making caffeinated beverages.
    public func prepareRecipe() {
        // In the template, each step of the algorithm is represented by a method.
        boilWater()
        brew()
        pourInCup()
        addCondiments()
    }
    
    // Some methods are handled by this class... and some are handled by the subclass.
    
    public func boilWater() {
        print("Boiling water")
    }
    
    public func pourInCup() {
        print("Pouring into cup")
    }
}
