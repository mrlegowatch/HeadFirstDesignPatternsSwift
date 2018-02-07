//: [Previous](@previous)
//: # The final Facade implementation
//:
//: The final Facade implementation places the relevant code in source files, and the playground takes the role of just running the test.
//:

let tuner = Tuner("Top-O-Line Tuner")
let dvd = DvdPlayer("Top-O-Line DVD Player")
let cd = CdPlayer("Top-O-Line CD Player")
let amp = Amplifier("Top-O-Line Amplifier")
let projector = Projector("Top-O-Line Projector", dvdPlayer: dvd)
let lights = TheaterLights()
let screen = Screen()
let popper = PopcornPopper()

let homeTheater = HomeTheaterFacade(amp: amp, tuner: tuner, dvd: dvd, cd: cd, projector: projector, lights: lights, screen: screen, popper: popper)

homeTheater.watchMovie("Raiders of the Lost Ark")
homeTheater.endMovie()

//: [Next](@next)
