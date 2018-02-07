//: [Previous](@previous)
//: ## Designing the Weather Station

import Foundation

// All our weather components implement the Observer interface. This gives the Subject a common interface to talk to when it comes time to update the observers.
protocol Observer {
    
    func update(temperature: Double, humidity: Double, pressure: Double)
    
}

// Here's our subject interface. This should look familiar.
protocol Subject {
    
    func register(observer: Observer)
    
    func remove(observer: Observer)
    
    func notifyObservers()
    
}

// Let's also create an interface for all display elements to implement. The display elements just need to implement a display() method.
// The DiplayElement interface just includes one method, display(), that we will call when the display element needs to be displayed.
protocol DisplayElement {
    
    func display()
    
}

//: ## Implementing the Subject interface in WeatherData

// WeatherData now implements the Subject interface.
class WeatherData: Subject {
    // We've added an array list to hold the Observers, and initialize it.
    var observers: [Observer] = []
    
    var temperature: Double = 0
    var humidity: Double = 0
    var pressure: Double = 0

    // Both of these methods take an Observer as an argument; that is, the Observer to be registered or removed.
    func register(observer: Observer) {
        observers.append(observer)
    }
    
    // IN SWIFT: to support remove() in this example, we would have Observer conform to the Equatable protocol (== is best implemented as Equatable, which has Self requirement), and we might question the use of Array to store Observers. I am skipping over this implementation detail, to keep the example simple, and because the book chapter only alludes to the role of remove(), but doesn't further discuss or demonstrate its use, anyway.
    // Also, in Swift, the role of remove() for Notifications has been greatly diminished in recent versions of macOS and iOS.
    func remove(observer: Observer) {
        //if let index = observers.index(where: { $0 == observer }) {
        //    observers.remove(at: index)
        //}
    }
    
    // This method is called to notify all observers when the Subject's state has changed.
    func notifyObservers() {
        for observer in observers {
            // These are the state values the Observers get from the Subject when a weather measurement changes.
            observer.update(temperature: temperature, humidity: humidity, pressure: pressure)
        }
    }
    
    func measurementsChanged() {
        notifyObservers()
    }
    
    func setMeasurements(temperature: Double, humidity: Double, pressure: Double) {
        self.temperature = temperature
        self.humidity = humidity
        self.pressure = pressure
        measurementsChanged()
    }
}

//: ## Now, let's build those display elements

class CurrentConditionsDisplay: Observer, DisplayElement {
    private var temperature: Double = 0
    private var humidity: Double = 0
    private var weatherData: Subject
    
    init(_ weatherData: Subject) {
        self.weatherData = weatherData
        weatherData.register(observer: self)
    }
    
    func update(temperature: Double, humidity: Double, pressure: Double) {
        self.temperature = temperature
        self.humidity = humidity
        display()
    }
    
    func display() {
        print("Current conditions: \(temperature)F degrees and \(humidity)% humidity")
    }
}

class StatisticsDisplay: Observer, DisplayElement {
    private var temperatureSum: Double = 0
    private var temperatureCount: Double = 0
    private var minimumTemperature: Double = .infinity
    private var maximumTemperature: Double = -.infinity
    
    private var averageTemperature: Double {
        return temperatureCount > 0 ? temperatureSum / temperatureCount : 0
    }
    
    private var weatherData: Subject
    
    init(_ weatherData: Subject) {
        self.weatherData = weatherData
        weatherData.register(observer: self)
    }
    
    func update(temperature: Double, humidity: Double, pressure: Double) {
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
    
    func display() {
        print("Avg/Max/Min temperature = \(averageTemperature)/\(maximumTemperature)/\(minimumTemperature)")
    }
}

class ForecastDisplay: Observer, DisplayElement {
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
    
    init(_ weatherData: Subject) {
        self.weatherData = weatherData
        weatherData.register(observer: self)
    }
    
    func update(temperature: Double, humidity: Double, pressure: Double) {
        lastPressure = currentPressure
        currentPressure = pressure
        display()
    }
    
    func display() {
        print("Forecast: \(forecast)")
    }
}

class HeatIndexDisplay: Observer, DisplayElement {
    private var heatIndex: Double = 0
    private var weatherData: Subject
    
    init(_ weatherData: Subject) {
        self.weatherData = weatherData
        weatherData.register(observer: self)
    }
    
    func update(temperature: Double, humidity: Double, pressure: Double) {
        heatIndex = computeHeatIndex(temperature, humidity);
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
            (0.0000000000481975 * (t * t * t * rh * rh * rh)));
        return index;
    }
    
    func display() {
        // Use a format string to limit the decimal places of the heat index.
        let heatIndexString = String(format: "Heat index is %.5f", heatIndex)
        print(heatIndexString)
    }
}

//: ## Power up the Weather Station

let weatherData = WeatherData()
let currentDisplay = CurrentConditionsDisplay(weatherData)
let statisticsDisplay = StatisticsDisplay(weatherData)
let forecastDisplay = ForecastDisplay(weatherData)
let heatIndexDisplay = HeatIndexDisplay(weatherData)

weatherData.setMeasurements(temperature: 80, humidity: 65, pressure: 30.4)
weatherData.setMeasurements(temperature: 82, humidity: 70, pressure: 29.2)
weatherData.setMeasurements(temperature: 78, humidity: 90, pressure: 29.2)

//: [Next](@next)
