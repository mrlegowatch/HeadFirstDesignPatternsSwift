//
//  ChocolateBoiler.swift
//  Singleton Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/4/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class ChocolateBoiler {
    private var isEmpty: Bool
    private var isBoiled: Bool
    
    // IN SWIFT: a static let is the preferred way to implement a singleton.
    public static let instance = ChocolateBoiler()
    
    private init() {
        print("Creating unique instance of Chocolate Boiler")

        // This code only started when the boiler is empty!
        isEmpty = false
        isBoiled = false
    }
    
    public func fill() {
        // To fill the boiler, it must be empty, and once it's full, we set the empty and boiled flags.
        if isEmpty {
            isEmpty = false
            isBoiled = false
            // fill the boiler with a milk/chocolate mixture
        }
    }
    
    public func drain() {
        // To drain the boiler, it must be full (non-empty) and also boiled. Once it is drained we set empty back to true.
        if !isEmpty && isBoiled {
            // drain the boiled milk and chocolate
            isEmpty = true
        }
    }
    
    public func boil() {
        // To boil the mixture, the boiler has to be full and not already boiled. Once it's boiled we set the boiled flag to true.
        if !isEmpty && !isBoiled {
            // bring the contents to a boil
            isBoiled = true
        }
    }
}
