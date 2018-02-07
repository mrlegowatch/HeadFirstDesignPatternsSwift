//
//  GarageDoorOpenCommand.swift
//  Command Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/4/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class GarageDoorOpenCommand: Command {
    private let garageDoor: GarageDoor
    
    public init(_ garageDoor: GarageDoor) {
        self.garageDoor = garageDoor
    }
    
    public func execute() {
        garageDoor.up()
    }
    
    public func undo() {
        garageDoor.down()
    }
}
