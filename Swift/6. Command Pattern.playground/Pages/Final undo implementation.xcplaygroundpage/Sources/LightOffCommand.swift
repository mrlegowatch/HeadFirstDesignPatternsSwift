//
//  LightOffCommand.swift
//  Command Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/4/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class LightOffCommand: LightCommand {
    
    public init(_ light: Light) {
        super.init(light, state: .off)
    }
    
}
