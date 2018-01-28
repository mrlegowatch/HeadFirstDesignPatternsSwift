//
//  Tea.swift
//  Template Method Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/17/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class Tea: CaffeineBeverage {
    
    public init() { }

    public func brew() {
        print("Steeping the tea")
    }
    
    public func addCondiments() {
        print("Adding Lemon")
    }
}
