//
//  DJView.swift
//  DJ
//
//  Created by Kevin Lee on 7/26/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

import Cocoa

public class DJView: NSView {

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
    
}
