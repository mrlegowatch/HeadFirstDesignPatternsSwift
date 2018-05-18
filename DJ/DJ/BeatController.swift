//
//  BeatController.swift
//  DJ
//
//  Created by Brian Arnold on 5/18/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

class BeatController: ControllerInterface {
    var model: BeatModelInterface
    var view: DJView
    
    init(model: BeatModelInterface, view: DJView) {
        self.model = model
        self.view = view
        
        // TODO: when does the view get created?
        // view.createView()
        // view.createControls()
        // view.disableStopMenuItem()
        // view.enableStartMenuItem()
        
        // TODO: should we use a popup menu or the real menu bar?
    }
    
    func start() {
        //
    }
    
    func stop() {
        //
    }
    
    func increaseBPM() {
        //
    }
    
    func decreaseBPM() {
        //
    }
    
    func set(bpm: Int) {
        //
    }
    
    
}
