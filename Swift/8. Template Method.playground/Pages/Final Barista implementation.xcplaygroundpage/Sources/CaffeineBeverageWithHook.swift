//
//  CaffeineBeverageWithHook.swift
//  Template Method Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/17/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public protocol CaffeineBeverageWithHook {
    
    func prepareRecipe()
    
    func brew()
    
    func addCondiments()
    
    func boilWater()
    
    func pourInCup()
    
    var customerWantsCondiments: Bool { get }
    
}

extension CaffeineBeverageWithHook {
    
    public func prepareRecipe() {
        boilWater()
        brew()
        pourInCup()
        if customerWantsCondiments {
            addCondiments()
        }
    }
    
    public func boilWater() {
        print("Boiling water")
    }
    
    public func pourInCup() {
        print("Pouring into cup")
    }
    
    public var customerWantsCondiments: Bool {
        return true
    }
}
