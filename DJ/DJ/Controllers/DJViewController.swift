//
//  DJViewController.swift
//  DJ
//
//  Created by Kevin Lee on 7/26/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

import Cocoa

class DJViewController: NSViewController {
    
    // view of the model
    @IBOutlet public var beatBar: NSProgressIndicator!
    @IBOutlet public var bpmOutputLabel: NSTextField!
    
    // user interface controls part of the view
    @IBOutlet public var bpmLabel: NSTextField!
    @IBOutlet public var bpmTextField: NSTextField!
    @IBOutlet public var setBPMButton: NSButton!
    @IBOutlet public var increaseBPMButton: NSButton!
    @IBOutlet public var decreaseBPMButton: NSButton!
    
    public var startMenuItem: NSMenuItem! {
        return NSApplication.shared.mainMenu?.item(withTitle: "DJ")?.submenu?.item(withTitle: "Start")
    }
    
    public var stopMenuItem: NSMenuItem! {
        return NSApplication.shared.mainMenu?.item(withTitle: "DJ")?.submenu?.item(withTitle: "Stop")
    }
    
    var model: BeatModelInterface
    var controller: ControllerInterface?
    
    required init?(coder: NSCoder) {
        model = BeatModel()
        super.init(coder: coder)
        controller = BeatController(model: model, view: self)

        NotificationCenter.default.addObserver(forName: BeatModelNotifications.bpmChanged, object: model, queue: nil, using: updateBPM)
        NotificationCenter.default.addObserver(forName: BeatModelNotifications.beatHappened, object: model, queue: nil, using: updateBeat)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    // "Model View" Controls
    func updateBPM(notification: Notification) {
        let bpm = model.bpm
        if (bpm == 0) {
            bpmOutputLabel.stringValue = "offline"
        } else {
            bpmOutputLabel.stringValue = "Current BPM: \(bpm)"
        }
    }
    
    func updateBeat(notification: Notification) {
        
    }
    
    // User Interface Controls
    func enableStopMenuItem() {
        stopMenuItem.isEnabled = true
    }
    func disableStopMenuItem() {
        stopMenuItem.isEnabled = false
    }
    func enableStartMenuItem() {
        startMenuItem.isEnabled = true
    }
    func disableStartMenuItem() {
        startMenuItem.isEnabled = false
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
        // Make sure to set BPM only if the textfield input is a valid integer
        if let intVal = Int(bpmTextField.stringValue) {
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
