//
//  TeaWithHook.swift
//  Template Method Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/17/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

import Foundation // for arc4random

public class TeaWithHook: CaffeineBeverageWithHook {
    
    public init() { }

    public func brew() {
        print("Steeping the tea")
    }
    
    public func addCondiments() {
        print("Adding Lemon")
    }
    
    // Here's where you override the hook and provide your own functionality.
    public var customerWantsCondiments: Bool {
        let answer = getUserInput()
        
        // Get the user's input on the condiment decision and return true or false depending on the input.
        return answer.lowercased().hasPrefix("y")
    }
    
    private func getUserInput() -> String {
        // In Swift, we don't have a convenient way for a playground to capture user keyboard input,
        // so we simulate it here, with randomness.
        
        let possibleAnswers = ["yes", "no"]
        let answer = possibleAnswers[Int(arc4random() % 2)]
        
        print("Would you like lemon with your tea (y/n)? \(answer)")
        return answer
    }
}
