//
//  StereoCommand.swift
//  Command Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/4/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

// IN SWIFT: implement a base class for controlling the stereo.
public class StereoCommand: Command {
    // IN SWIFT: scope to internal, so that the StereoOnWithCDCommand subclass can set additional state.
    internal let stereo: Stereo
    
    private let newState: Stereo.State
    
    // We've added local state to keep track of the previous light state.
    // IN SWIFT: This is "!" because it's not initialized until execute() is called.
    private var previousState: Stereo.State!
    
    public init(_ stereo: Stereo, state: Stereo.State) {
        self.stereo = stereo
        self.newState = state
    }
    
    public func execute() {
        self.previousState = stereo.state
        stereo.state = self.newState
    }
    
    public func undo() {
        // Note: device and volume level are "sticky" (not restored to previous values)
        stereo.state = self.previousState
    }
}
