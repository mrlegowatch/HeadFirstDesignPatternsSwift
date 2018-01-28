//
//  CeilingFanCommand.swift
//  Command Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/4/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

// IN SWIFT: we create a base class to store the new speed.
// IN SWIFT: we won't create individual command classes for setting the speed or turning the fan off. This has a consequence of exposing CeilingFan.Speed to clients, but we might make this tradeoff to reduce the overall number of command classes.
public class CeilingFanCommand: Command {
    private let ceilingFan: CeilingFan
    private let newSpeed: CeilingFan.Speed
    // We've added local state to keep track of the previous speed of the fan.
    // IN SWIFT: This is "!" because it's not initialized until execute() is called.
    private var previousSpeed: CeilingFan.Speed!
    
    public init(_ ceilingFan: CeilingFan, speed: CeilingFan.Speed) {
        self.ceilingFan = ceilingFan
        self.newSpeed = speed
    }
    
    public func execute() {
        // In execute, before we change the speed of the fan, we need to first record its previous state, just in case we need to undo our actions.
        self.previousSpeed = ceilingFan.speed
        ceilingFan.speed = newSpeed
    }
    
    public func undo() {
        // To undo, we set the speed of the fan back to its previous speed.
        ceilingFan.speed = previousSpeed
    }
}
