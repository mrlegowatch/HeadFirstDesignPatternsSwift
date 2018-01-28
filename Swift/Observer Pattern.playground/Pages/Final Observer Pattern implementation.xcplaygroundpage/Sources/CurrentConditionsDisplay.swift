//
//  CurrentConditionsDisplay.swift
//  Observer Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/3/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class CurrentConditionsDisplay: Observer, DisplayElement {
    private var temperature: Double = 0
    private var humidity: Double = 0
    private var weatherData: Subject
    
    public init(_ weatherData: Subject) {
        self.weatherData = weatherData
        weatherData.register(observer: self)
    }
    
    public func update(temperature: Double, humidity: Double, pressure: Double) {
        self.temperature = temperature
        self.humidity = humidity
        display()
    }
    
    public func display() {
        print("Current conditions: \(temperature)F degrees and \(humidity)% humidity")
    }
}
