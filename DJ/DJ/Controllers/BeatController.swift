//
//  BeatController.swift
//  DJ
//
//  Created by Brian Arnold on 5/18/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

import Cocoa

class BeatController: ControllerInterface {
    
    var model: BeatModelInterface
    var aDJviewController: DJViewController
    
    init(model: BeatModelInterface, view: DJViewController) {
        self.model = model
        self.aDJviewController = view
    }
    
    func start() {
        model.on()
        aDJviewController.disableStartMenuItem()
        aDJviewController.enableStopMenuItem()
    }
    
    func stop() {
        model.off()
        aDJviewController.disableStopMenuItem()
        aDJviewController.enableStartMenuItem()
    }
    
    func increaseBPM() {
        set(bpm: model.bpm + 1)
    }
    
    func decreaseBPM() {
        let bpm = model.bpm
        if bpm > 0 {
            set(bpm: bpm - 1)
        }
    }
    
    func set(bpm: Int) {
        model.bpm = bpm
    }
}
