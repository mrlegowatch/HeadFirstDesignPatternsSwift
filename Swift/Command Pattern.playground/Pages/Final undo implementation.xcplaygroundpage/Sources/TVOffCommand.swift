//
//  TVOffCommand.swift
//  Command Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/4/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class TVOffCommand: Command {
    private let tv: TV
    
    public init(_ tv: TV) {
        self.tv = tv
    }
    
    public func execute() {
        tv.off()
    }
    
    public func undo() {
        tv.on()
    }
}
