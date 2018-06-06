//
//  BeatModelInterface.swift
//  DJ
//
//  Created by Brian Arnold on 5/16/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

import Foundation // For Notification

public protocol BeatModelInterface {
    
    func on()
    
    func off()
    
    var bpm: Int { get set }
    
    // IN SWIFT: No observer pattern methods are required here, if we use Foundation Notifications.
}

struct BeatModelNotifications {
    
    // IN SWIFT: specify Notifications that BeatModelInterface will send when bpm changes or a beat happens.

    static let bpmChanged = Notification.Name("bpmChanged")

    static let beatHappened = Notification.Name("beatHappened")

}
