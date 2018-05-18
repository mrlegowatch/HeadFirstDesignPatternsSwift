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
// TODO: What is the closest thing to ActionListener? NSViewController?
// TODO: I suspect that NSViewController implies two 'views' in the book's sense,
// since Java is using one 'view' to control two windows, which you'd never do with Cocoa AppKit or iOS UIKit.
public class DJView  {
    
    var model: BeatModelInterface
    
    var controller: ControllerInterface
    
    // TODO: Use NSView classes here
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
    
    // TODO: leverage Main.storyboard to create the views
    // public void createView() {
    //     // Create all Swing components here
    // }
    
    // public void createControls() {
    //     // Create all Swing components here
    // }
    
    init(controller: ControllerInterface, model: BeatModelInterface) {
        self.model = model
        self.controller = controller
        
        NotificationCenter.default.addObserver(forName: .bpmChanged, object: self, queue: nil, using: bpmChanged)
        
        NotificationCenter.default.addObserver(forName: .beatHappened, object: self, queue: nil, using: beatHappened)
    }
    
    func bpmChanged(notification: Notification) {
        
    }
    
    func beatHappened(notification: Notification) {
        
    }
    
    
}
