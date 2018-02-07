//
//  Amplifier.swift
//  Façade Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/9/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class Amplifier: CustomStringConvertible {
    public let description: String
    var tuner: Tuner?
    var dvdPlayer: DvdPlayer?
    var cdPlayer: CdPlayer?
    
    public init(_ description: String) {
        self.description = description
    }
    
    public func on() {
        print("\(description) on")
    }
    
    public func off() {
        print("\(description) off")
    }
    
    public func setDvd(_ dvd: DvdPlayer) {
        self.dvdPlayer = dvd
        print("\(description) setting DVD player to \(dvd)")
    }

    public func setTuner(_ tuner: Tuner) {
        self.tuner = tuner
        print("\(description) setting DVD player to \(tuner)")
    }

    public func setCd(_ cd: CdPlayer) {
        self.cdPlayer = cd
        print("\(description) setting DVD player to \(cd)")
    }

    public func setSurroundSound() {
        print("\(description) surround sound on (5 speakers, 1 subwoofer)")
    }
    
    public func setVolume(_ level: Int) {
        print("\(description) setting volume to \(level)")
    }
}
