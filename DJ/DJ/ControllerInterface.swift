//
//  ControllerInterface.swift
//  DJ
//
//  Created by Brian Arnold on 5/16/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

protocol ControllerInterface {
    
    func start()
    
    func stop()
    
    func increaseBPM()
    
    func decreaseBPM()
    
    func set(bpm: Int)
    
}
