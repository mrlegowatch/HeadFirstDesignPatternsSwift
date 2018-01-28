//
//  RemoteControlWithUndo.swift
//  Command Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/4/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class RemoteControlWithUndo {
    private var onCommands: [Command?] = []
    private var offCommands: [Command?] = []
    private var undoCommand: Command?
    
    public init() {
        onCommands = [Command?](repeating: nil, count: 7)
        offCommands = [Command?](repeating: nil, count: 7)
        undoCommand = nil
    }
    
    public func setCommand(slot: Int, on onCommand: Command, off offCommand: Command) {
        onCommands[slot] = onCommand
        offCommands[slot] = offCommand
    }
    
    public func onButtonWasPushed(slot: Int) {
        onCommands[slot]?.execute()
        undoCommand = onCommands[slot]
    }
    
    public func offButtonWasPushed(slot: Int) {
        offCommands[slot]?.execute()
        undoCommand = offCommands[slot]
    }
    
    public func undoButtonWasPushed() {
        undoCommand?.undo()
    }
}

extension RemoteControlWithUndo: CustomStringConvertible {
    
    public var description: String {
        var desc = "\n----------- Remote Control -----------\n"
        for index in 0..<onCommands.count {
            desc += "[slot \(index)] \(String(describing: onCommands[index]))    \(String(describing: offCommands[index]))\n"
        }
        desc += "[undo] \(String(describing: undoCommand))"
        return desc
    }
}
