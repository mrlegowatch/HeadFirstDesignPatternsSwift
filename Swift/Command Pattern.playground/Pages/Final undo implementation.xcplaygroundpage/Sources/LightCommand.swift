//
//  LightCommand.swift
//  Command Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/4/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

// IN SWIFT: we create a base class to store the light state.
// IN SWIFT: we will still create individual command classes for setting the speed or turning the fan off, to avoid exposing Light.State to clients. We might make this tradeoff even though it increases the overall number of command classes.
public class LightCommand: Command {
    private let light: Light
   
    private let newState: Light.State
    // We've added local state to keep track of the previous light state.
    // IN SWIFT: This is "!" because it's not initialized until execute() is called.
    private var previousState: Light.State!
    
    // IN SWIFT: we might make the init() method internal, to avoid exposing Light.State to clients.
    internal init(_ light: Light, state: Light.State) {
        self.light = light
        self.newState = state
    }
    
    public func execute() {
        self.previousState = light.state
        light.state = self.newState
    }
    
    public func undo() {
        light.state = self.previousState
    }
}
