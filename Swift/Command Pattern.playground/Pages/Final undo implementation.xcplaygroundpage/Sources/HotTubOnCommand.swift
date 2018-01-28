//
//  HotTubOnCommand.swift
//  Command Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/4/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class HotTubOnCommand: Command {
    private let hotTub: HotTub
    
    public init(_ hotTub: HotTub) {
        self.hotTub = hotTub
    }
    
    public func execute() {
        hotTub.on()
    }
    
    public func undo() {
        hotTub.off()
    }
}
