//
//  MacroCommand.swift
//  Command Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/4/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class MacroCommand: Command {
    private let commands: [Command]
    
    public init(_ commands: [Command]) {
        // Take an array of Commands and store them in the Macro command
        self.commands = commands
    }
    
    public func execute() {
        for command in commands {
            // When the macro gets executed by the remote, execute those commands one at a time.
            command.execute()
        }
    }
    
    public func undo() {
        // Make sure to "undo" the commands in reverse order.
        for command in commands.reversed() {
            command.undo()
        }
    }
}
