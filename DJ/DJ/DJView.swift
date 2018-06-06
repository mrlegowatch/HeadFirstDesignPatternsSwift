//
//  DJView.swift
//  DJ
//
//  Created by Brian Arnold on 5/16/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

import Foundation // For Notification

// Implements: ActionListener, BeatObserver, BPMObserver
// IN SWIFT: we use Foundation's NSNotification for observing.
// TODO: Combine this file with ViewController.
public class DJView  {
    
    var model: BeatModelInterface
    
    var controller: ControllerInterface
    
    // TODO: Use NSView classes here, make them all "@IBOutlet var unowned name: Kind!"
    // var viewFrame: JFrame
    // var viewPanel: JPanel
    // var beatBar: BeatBar
    // var bpmOutputLabel: JLabel
    
    // var bpmLabel: JLabel
    // var bpmTextField JTextField
    // var increaseBPMButton: JButton
    // var decreaseBPMButton: JButton
    // var menuBar: JMenuBar
    // var menu: JMenu
    // var startMenuItem: JMenuItem
    // var stopMenuItem: JMenuItem
    
    // TODO: leverage Main.storyboard to create the views and connect them to IBOutlets
    // public void createView() {
    //     // Create all Swing components here
    // }
    
    // public void createControls() {
    //     // Create all Swing components here
    // }
    
    init(controller: ControllerInterface, model: BeatModelInterface) {
        self.model = model
        self.controller = controller
        
        NotificationCenter.default.addObserver(forName: BeatModelNotifications.bpmChanged, object: self, queue: nil, using: bpmChanged)
        
        NotificationCenter.default.addObserver(forName: BeatModelNotifications.beatHappened, object: self, queue: nil, using: beatHappened)
    }
    
    func bpmChanged(notification: Notification) {
        
    }
    
    func beatHappened(notification: Notification) {
        
    }
    
    // TODO: the rest
}
