//
//  StereoOnWithCDCommand.swift
//  Command Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/4/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class StereoOnWithCDCommand: StereoOnCommand {
    
    public override func execute() {
        super.execute()
        stereo.device = .CD
        stereo.volume = Stereo.Volume(level: 11)!
    }
}
