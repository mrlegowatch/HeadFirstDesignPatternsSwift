//: [Previous](@previous)
//: # Final Weather Station implementation
//:
//: The final Weather Station implementation places the relevant code in source files, and the playground takes the role of just running the test.

let weatherData = WeatherData()
let currentDisplay = CurrentConditionsDisplay(weatherData)
let statisticsDisplay = StatisticsDisplay(weatherData)
let forecastDisplay = ForecastDisplay(weatherData)
let heatIndexDisplay = HeatIndexDisplay(weatherData)

weatherData.setMeasurements(temperature: 80, humidity: 65, pressure: 30.4)
weatherData.setMeasurements(temperature: 82, humidity: 70, pressure: 29.2)
weatherData.setMeasurements(temperature: 78, humidity: 90, pressure: 29.2)

//: [Next](@next)
