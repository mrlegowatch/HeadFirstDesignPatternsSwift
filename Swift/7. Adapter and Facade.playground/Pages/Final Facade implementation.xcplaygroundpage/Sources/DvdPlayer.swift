//
//  DvdPlayer.swift
//  Façade Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/9/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class DvdPlayer: CustomStringConvertible {
    public let description: String
    var movie: String = ""
    
    public init(_ description: String) {
        self.description = description
    }
    
    public func on() {
        print("\(description) on")
    }
    
    public func play(_ movie: String) {
        self.movie = movie
        print("\(description) playing \"\(movie)\"")
    }
    
    public func stop() {
        print("\(description) stopped \"\(movie)\"")
    }
    
    public func eject() {
        print("\(description) eject")
    }
    
    public func off() {
        print("\(description) off")
    }
    
}
