//: # Chapter 2: The Observer Pattern
//:
//: Comments are from the Head First Design Patterns book.
//:
//: Where Swift deviates from the book, the annotation "IN SWIFT" is used in the comment.
//:
//: ## Taking a first, misguided SWAG at the Weather Station

class CurrentConditionsDisplay {
    func update(_ temp: Double, _ humidity: Double, _ pressure: Double) { }
}

class StatisticsDisplay {
    func update(_ temp: Double, _ humidity: Double, _ pressure: Double) { }
}

class ForecastDisplay {
    func update(_ temp: Double, _ humidity: Double, _ pressure: Double) { }
}

//: ## What's wrong with our implementation?

class WeatherData {
    let currentConditionsDisplay: CurrentConditionsDisplay
    let statisticsDisplay: StatisticsDisplay
    let forecastDisplay: ForecastDisplay

    var temperature: Double = 0
    var humidity: Double = 0
    var pressure: Double = 0
    
    init() {
        self.currentConditionsDisplay = CurrentConditionsDisplay()
        self.statisticsDisplay = StatisticsDisplay()
        self.forecastDisplay = ForecastDisplay()

    }
    func measurementsChanged() {
        let temperature = self.temperature
        let humidity = self.humidity
        let pressure = self.pressure
        
        // Area of change. We need to encapsulate this.
        // By coding to concrete implementations we have no way to add or remove other display elements without making changes to the program.
        // At least we seem to be using a common interface to talk to the display elements... they all have an update() method that takes temperature, humidity, and pressure values.
        currentConditionsDisplay.update(temperature, humidity, pressure)
        statisticsDisplay.update(temperature, humidity, pressure)
        forecastDisplay.update(temperature, humidity, pressure)
    }
}

//: [Next](@next)
