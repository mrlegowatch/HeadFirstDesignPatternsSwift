//
//  StatisticsDisplay.swift
//  Observer Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/3/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class StatisticsDisplay: Observer, DisplayElement {
    private var temperatureSum: Double = 0
    private var temperatureCount: Double = 0
    private var minimumTemperature: Double = .infinity
    private var maximumTemperature: Double = -.infinity
    
    private var averageTemperature: Double {
        return temperatureCount > 0 ? temperatureSum / temperatureCount : 0
    }
    
    private var weatherData: Subject
    
    public init(_ weatherData: Subject) {
        self.weatherData = weatherData
        weatherData.register(observer: self)
    }
    
    public func update(temperature: Double, humidity: Double, pressure: Double) {
        temperatureSum += temperature
        temperatureCount += 1
        if temperature < minimumTemperature {
            minimumTemperature = temperature
        }
        if temperature > maximumTemperature {
            maximumTemperature = temperature
        }
        
        display()
    }
    
    public func display() {
        print("Avg/Max/Min temperature = \(averageTemperature)/\(maximumTemperature)/\(minimumTemperature)")
    }
}
