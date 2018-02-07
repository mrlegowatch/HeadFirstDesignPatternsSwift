//
//  ForecastDisplay.swift
//  Observer Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/3/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class ForecastDisplay: Observer, DisplayElement {
    private var lastPressure: Double = 29.92
    private var currentPressure: Double = 29.92
    
    private var forecast: String {
        var theForecast = ""
        if currentPressure > lastPressure {
            theForecast = "Improving weather on the way!"
        } else if currentPressure == lastPressure {
            theForecast = "More of the same"
        } else if currentPressure < lastPressure {
            theForecast = "Watch out for cooler, rainy weather"
        }
        return theForecast
    }
    
    private var weatherData: Subject
    
    public init(_ weatherData: Subject) {
        self.weatherData = weatherData
        weatherData.register(observer: self)
    }
    
    public func update(temperature: Double, humidity: Double, pressure: Double) {
        lastPressure = currentPressure
        currentPressure = pressure
        display()
    }
    
    public func display() {
        print("Forecast: \(forecast)")
    }
}
