//
//  DJViewController.swift
//  DJ
//
//  Created by Kevin Lee on 7/26/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

import Cocoa

class DJViewController: NSViewController {
    
    var model: BeatModelInterface
    var controller: ControllerInterface?
    
    required init?(coder: NSCoder) {
        model = BeatModel()
        super.init(coder: coder)
        controller = BeatController(model: model, view: self)

        NotificationCenter.default.addObserver(forName: BeatModelNotifications.bpmChanged, object: model, queue: nil, using: updateBPM)
        NotificationCenter.default.addObserver(forName: BeatModelNotifications.beatHappened, object: model, queue: nil, using: updateBeat)
    }
    
    public var aDJView: DJView! {
        guard isViewLoaded else {return nil}
        return view as! DJView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // "Model View" Controls
    func updateBPM(notification: Notification) {
        let bpm = model.bpm
        if (bpm == 0) {
            aDJView.bpmOutputLabel.stringValue = "offline"
        } else {
            self.aDJView.bpmOutputLabel.stringValue = "Current BPM: \(bpm)"
        }
    }
    
    func updateBeat(notification: Notification) {
        // aDJView.beatBar.
        
        
        
        
        
        
        
    }
    
    // User Interface Controls
    func enableStopMenuItem() {
        aDJView.stopMenuItem.isEnabled = true
    }
    func disableStopMenuItem() {
        aDJView.stopMenuItem.isEnabled = false
    }
    func enableStartMenuItem() {
        aDJView.startMenuItem.isEnabled = true
    }
    func disableStartMenuItem() {
        aDJView.startMenuItem.isEnabled = false
    }
    
    // NOTE: StartMenuItem connected here via First Responder
    @IBAction func startMenuItemClicked(_ sender: Any) {
        controller!.start()
    }
    
    // NOTE: StopMenuItem connected here via First Responder
    @IBAction func stopMenuItemClicked(_ sender: Any) {
        controller!.stop()
    }
    
    @IBAction func setBPMButtonClicked(_ sender: Any) {
        if let intVal = Int(aDJView.bpmTextField.stringValue) {
            controller!.set(bpm: intVal)
        }
    }
    
    @IBAction func decreaseBPMButtonClicked(_ sender: Any) {
            controller!.decreaseBPM()
    }
    
    @IBAction func increaseBPMButtonClicked(_ sender: Any) {
            controller!.increaseBPM()
        
    }
    
}
