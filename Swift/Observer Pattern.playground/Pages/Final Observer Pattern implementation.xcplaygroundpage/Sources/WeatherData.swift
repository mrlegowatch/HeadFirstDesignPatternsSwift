//
//  WeatherData.swift
//  Observer Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/3/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

// WeatherData now implements the Subject interface.
public class WeatherData: Subject {
    // We've added an array list to hold the Observers, and initialize it.
    var observers: [Observer] = []
    
    var temperature: Double = 0
    var humidity: Double = 0
    var pressure: Double = 0
    
    public init() { }
    
    // Both of these methods take an Observer as an argument; that is, the Observer to be registered or removed.
    public func register(observer: Observer) {
        observers.append(observer)
    }
    
    // IN SWIFT: to support remove() in this example, we would have Observer conform to the Equatable protocol (== is best implemented as Equatable, which has Self requirement), and we might question the use of Array to store Observers. I am skipping over this implementation detail, to keep the example simple, and because the book chapter only alludes to the role of remove(), but doesn't further discuss or demonstrate its use, anyway.
    // Also, in Swift, the role of remove() for Notifications has been greatly diminished in recent versions of macOS and iOS.
    public func remove(observer: Observer) {
        //if let index = observers.index(where: { $0 == observer }) {
        //    observers.remove(at: index)
        //}
    }
    
    // This method is called to notify all observers when the Subject's state has changed.
    public func notifyObservers() {
        for observer in observers {
            // These are the state values the Observers get from the Subject when a weather measurement changes.
            observer.update(temperature: temperature, humidity: humidity, pressure: pressure)
        }
    }
    
    func measurementsChanged() {
        notifyObservers()
    }
    
    public func setMeasurements(temperature: Double, humidity: Double, pressure: Double) {
        self.temperature = temperature
        self.humidity = humidity
        self.pressure = pressure
        measurementsChanged()
    }
}
