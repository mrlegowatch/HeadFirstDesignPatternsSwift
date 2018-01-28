//
//  HeatIndexDisplay.swift
//  Observer Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 1/3/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

import Foundation // For String(format:)

public class HeatIndexDisplay: Observer, DisplayElement {
    private var heatIndex: Double = 0
    private var weatherData: Subject
    
    public init(_ weatherData: Subject) {
        self.weatherData = weatherData
        weatherData.register(observer: self)
    }
    
    public func update(temperature: Double, humidity: Double, pressure: Double) {
        heatIndex = computeHeatIndex(temperature, humidity)
        display()
    }
    
    private func computeHeatIndex(_ t: Double, _ rh: Double) -> Double {
        let index = (Double)((16.923 + (0.185212 * t) + (5.37941 * rh) - (0.100254 * t * rh)
            + (0.00941695 * (t * t)) + (0.00728898 * (rh * rh))
            + (0.000345372 * (t * t * rh)) - (0.000814971 * (t * rh * rh)) +
            (0.0000102102 * (t * t * rh * rh)) - (0.000038646 * (t * t * t)) + (0.0000291583 *
                (rh * rh * rh)) + (0.00000142721 * (t * t * t * rh)) +
            (0.000000197483 * (t * rh * rh * rh)) - (0.0000000218429 * (t * t * t * rh * rh)) +
            0.000000000843296 * (t * t * rh * rh * rh)) -
            (0.0000000000481975 * (t * t * t * rh * rh * rh)))
        return index
    }
    
    public func display() {
        // Use a format string to limit the decimal places of the heat index.
        let heatIndexString = String(format: "Heat index is %.5f", heatIndex)
        print(heatIndexString)
    }
}
