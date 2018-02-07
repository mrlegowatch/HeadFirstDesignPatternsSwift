//
//  Projector.swift
//  Façade Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/9/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class Projector: CustomStringConvertible {
    public let description: String
    let dvdPlayer: DvdPlayer
    
    public init(_ description: String, dvdPlayer: DvdPlayer) {
        self.description = description
        self.dvdPlayer = dvdPlayer
    }
    
    public func on() {
        print("\(description) on")
    }
    
    public func off() {
        print("\(description) off")
    }
    
    public func wideScreenMode() {
        print("\(description) in widescreen mode (16:9 aspect ratio)")
    }
}
