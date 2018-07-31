//
//  BeatModel.swift
//  DJ
//
//  Created by Brian Arnold on 5/16/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

import Foundation // For Notification
import AudioKit

public class BeatModel: BeatModelInterface {
    
    let oscBank = AKOscillatorBank()
    let sequencer = AKSequencer()
    let midi = AKMIDI()
    let sequenceLength = AKDuration(beats:1)
    
    public init() {
        setupAudio()
        buildTrackAndStart()
    }
    
    public func on() {
        sequencer.play()
        bpm = 90
    }
    
    public func off() {
        bpm = 0
        sequencer.stop()
    }

    public var bpm: Int = 90 {
        didSet {
            sequencer.setTempo(Double(bpm))
            NotificationCenter.default.post(name: BeatModelNotifications.bpmChanged, object: self)
        }
    }
    
    // this method is called by the MIDI code whenever a new beat starts
    func beatEvent() {
        NotificationCenter.default.post(name: BeatModelNotifications.beatHappened, object: self)
    }
    
    // IN SWIFT: Code to register and notify observers not required here.
    
    // Lots of MIDI code to handle the beat
    
    func setupAudio() {
        oscBank.attackDuration = 0.1
        oscBank.decayDuration = 0.1
        oscBank.sustainLevel = 0.1
        oscBank.releaseDuration = 0.3
    }
    func buildTrackAndStart() {
        
        let midiNode = AKMIDINode(node: oscBank)
        _ = sequencer.newTrack()
        sequencer.setLength(sequenceLength)

        
        sequencer.tracks[0].add(noteNumber: 69, velocity: 127, position: AKDuration(beats: 0), duration: AKDuration(beats: 0.1))
        
        AudioKit.output = midiNode
        
        do {
            try AudioKit.start()
        } catch {
            AKLog("AudioKit did not start!")
        }
        
        sequencer.setTempo(Double(bpm))
        sequencer.enableLooping()
    }
}
