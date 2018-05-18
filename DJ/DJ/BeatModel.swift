//
//  BeatModel.swift
//  DJ
//
//  Created by Brian Arnold on 5/16/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

import Foundation // For Notification

// TODO: choose an audio framework that provides starting, stopping, and tempo.
// https://developer.apple.com/library/content/documentation/DeviceDrivers/Conceptual/WritingAudioDrivers/AudioOnMacOSX/AudioOnMacOSX.html

public class BeatModel: BeatModelInterface {
    
    // TODO: var sequencer: Sequencer
    
    public init() {
        setupMidi()
        buildTrackAndStart()
    }
    
    public func on() {
        // sequencer.start()
        bpm = 90
    }
    
    public func off() {
        bpm = 0
        // sequencer.stop()
    }

    public var bpm: Int = 90 {
        didSet {
            // sequencer.setTempoInBPM(bpm)
            NotificationCenter.default.post(name: .bpmChanged, object: self)
        }
    }
        
    func beatEvent() {
        NotificationCenter.default.post(name: .beatHappened, object: self)
    }
    
    // IN SWIFT: Code to register and notify observers not required here.
    
    // Lots of MIDI code to handle the beat
    
    func setupMidi() {
        // TODO
    }
    
    func buildTrackAndStart() {
        // TODO
    }
}
