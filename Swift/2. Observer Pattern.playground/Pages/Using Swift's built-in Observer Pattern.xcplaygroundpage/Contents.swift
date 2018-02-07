//: [Previous](@previous)
/*:
 ## How Swift's built-in Observer Pattern works

Swift note: This section parallels the book example of how Java's Observer/Observable works, and how to apply it to WeatherData.
 
Swift's Foundation framework provides several kinds of Observer patterns, including:
 - **Property willSet/didSet**, for observing changes to individual properties within an object (usually from a subclass)
 - **Property Key-Value Observing**, for observing changes to individual properties from another object
 - **Notifications**, for observing arbitrary changes, scoped to a single class or to any object in the application
 - **Cross-process Notifications**, similar to Notifications, but for observing changes between processes

   For the purpose of this section, we will work with Notifications, because they most closely fit the WeatherData example.
 */
import Foundation

//: - For an Object to become an Observer, it calls `NotificationCenter.default.addObserver()` with a specific named notification, and one of its methods as a parameter.
//: - For an Observable to send notifications, it calls `NotificationCenter.default.post()` with a specific named notification and a sender.
//: - For an Observer to receive notifications, it implements the method whose name it passed in addObserver, with a Notification argument. The argument will contain the notification name and sender.

//: First, let's rework WeatherData to use Notifications

// IN SWIFT: WeatherData does not need to extend an Observable interface.
class WeatherData {
    var temperature: Double = 0
    var humidity: Double = 0
    var pressure: Double = 0

    // IN SWIFT: We declare a Notification.Name for each Notification that WeatherData will post. This name is scoped to this class, but it may alternatively be scoped to Notification.Name, or to nothing.
    static var measurementsChanged = Notification.Name("measurementsChanged")

    func setMeasurements(temperature: Double, humidity: Double, pressure: Double) {
        self.temperature = temperature
        self.humidity = humidity
        self.pressure = pressure
        
        // IN SWIFT: This sends the notification to all observers of the Notification name.
        NotificationCenter.default.post(name: WeatherData.measurementsChanged, object: self)
    }
}

//: Now let's rework the CurrentConditionsDisplay

protocol DisplayElement {
    func display()
}

// IN SWIFT: CurrentConditionsDisplay does not need to implement an Observer interface.
class CurrentConditionsDisplay: DisplayElement {
    private var temperature: Double = 0
    private var humidity: Double = 0
    
    // IN SWIFT: we don't need to pass in a reference to an Observable, but we still need to make a reference to the Notification.Name that we will be listening to; in this case, WeatherData.measurementsChanged.
    init() {
        // IN SWIFT: NotificationCenter.addObserver() is called to make its update method observe the named notification.
        // IN SWIFT: the #selector macro enables the compiler to reference the method by its signature at compile time.
        NotificationCenter.default.addObserver(self, selector: #selector(update(notification:)), name: WeatherData.measurementsChanged, object: nil)
    }
    
    // IN SWIFT: in order for an object's method to be used to observe notifications, it must have Objective-C linkage, which the `@objc` syntactic sugar provides.
    @objc func update(notification: Notification) {
        // IN SWIFT: as in Java, there is a check for the type of the Observable, in this case, the notification.object as WeatherData, so that we can access it.
        if let weatherData = notification.object as? WeatherData {
            self.temperature = weatherData.temperature
            self.humidity = weatherData.humidity
            display()
        }
    }
    
    func display() {
        print("Current conditions: \(temperature)F degrees and \(humidity)% humidity")
    }
}

class StatisticsDisplay: DisplayElement {
    private var temperatureSum: Double = 0
    private var temperatureCount: Double = 0
    private var minimumTemperature: Double = .infinity
    private var maximumTemperature: Double = -.infinity
    
    private var averageTemperature: Double {
        return temperatureCount > 0 ? temperatureSum / temperatureCount : 0
    }
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(update(notification:)), name: WeatherData.measurementsChanged, object: nil)
    }
    
    @objc func update(notification: Notification) {
        if let weatherData = notification.object as? WeatherData {
            temperatureSum += weatherData.temperature
            temperatureCount += 1
            if weatherData.temperature < minimumTemperature {
                minimumTemperature = weatherData.temperature
            }
            if weatherData.temperature > maximumTemperature {
                maximumTemperature = weatherData.temperature
            }
            
            display()
        }
    }
    
    func display() {
        print("Avg/Max/Min temperature = \(averageTemperature)/\(maximumTemperature)/\(minimumTemperature)")
    }
}

class ForecastDisplay: DisplayElement {
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
    
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(update(notification:)), name: WeatherData.measurementsChanged, object: nil)
        
    }
    
    @objc func update(notification: Notification) {
        if let weatherData = notification.object as? WeatherData {
            lastPressure = currentPressure
            currentPressure = weatherData.pressure
            display()
        }
    }
    
    func display() {
        print("Forecast: \(forecast)")
    }
}

class HeatIndexDisplay: DisplayElement {
    private var heatIndex: Double = 0
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(update(notification:)), name: WeatherData.measurementsChanged, object: nil)
        
    }
    
    @objc func update(notification: Notification) {
        if let weatherData = notification.object as? WeatherData {
            heatIndex = computeHeatIndex(weatherData.temperature, weatherData.humidity);
            display()
        }
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

//: ## Power up the Weather Station again, this time using Swift Notifications

let weatherData = WeatherData()
let currentDisplay = CurrentConditionsDisplay()
let statisticsDisplay = StatisticsDisplay()
let forecastDisplay = ForecastDisplay()
let heatIndexDisplay = HeatIndexDisplay()

weatherData.setMeasurements(temperature: 80, humidity: 65, pressure: 30.4)
weatherData.setMeasurements(temperature: 82, humidity: 70, pressure: 29.2)
weatherData.setMeasurements(temperature: 78, humidity: 90, pressure: 29.2)

//: [Next](@next)
