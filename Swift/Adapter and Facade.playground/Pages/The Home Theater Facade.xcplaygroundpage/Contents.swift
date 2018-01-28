//: [Previous](@previous)
//: # Home Sweet Home Theater

class Amplifier {
    let tuner: Tuner
    let dvdPlayer: DvdPlayer
    let cdPlayer: CdPlayer
    
    init(tuner: Tuner, dvdPlayer: DvdPlayer, cdPlayer: CdPlayer) {
        self.tuner = tuner
        self.dvdPlayer = dvdPlayer
        self.cdPlayer = cdPlayer
    }
    
    func on() {
        print("Top-O-Line Amplifier on")
    }
    
    func off() {
        print("Top-O-Line Amplifier off")
    }
    
    func setDvd(_ dvd: DvdPlayer) {
        print("Top-O-Line Amplifier setting DVD player to \(dvd)")
    }
    
    func setSurroundSound() {
        print("Top-O-Line Amplifier surround sound on (5 speakers, 1 subwoofer)")
    }
    
    func setVolume(_ level: Int) {
        print("Top-O-Line Amplifier setting volume to \(level)")
    }
}

class Tuner {
    // Not used in this example
}

class DvdPlayer {
    
    var movie: String = ""
    
    func on() {
        print("Top-O-Line DVD Player on")
    }
    
    func play(_ movie: String) {
        self.movie = movie
        print("Top-O-Line DVD Player playing \"\(movie)\"")
    }
    
    func stop() {
        print("Top-O-Line DVD Player stopped \"\(movie)\"")
    }
    
    func eject() {
        print("\(self) eject")
    }
    
    func off() {
        print("\(description) off")
    }
 
}

extension DvdPlayer: CustomStringConvertible {
    
    var description: String {
        return "Top-O-Line DVD Player"
    }
}

class CdPlayer {
    // Not used in this example
}

class Projector {
    let dvdPlayer: DvdPlayer
    
    init(dvdPlayer: DvdPlayer) {
        self.dvdPlayer = dvdPlayer
    }
    
    func on() {
        print("Top-O-Line Projector on")
    }
    
    func off() {
        print("Top-O-Line Projector off")
    }
    
    func wideScreenMode() {
        print("Top-O-Line Projector in widescreen mode (16:9 aspect ratio)")
    }
}


class TheaterLights {
 
    func on() {
        print("Theater Ceiling Lights on")
    }
    
    func dim(_ percent: Int) {
        print("Theater Ceiling Lights dimming to \(percent)%")
    }
    
}

class Screen {
    
    func down() {
        print("Theater Screen going down")
    }
    
    func up() {
        print("Theater Screen going up")
    }
}

class PopcornPopper {
    
    func on() {
        print("Popcorn Popper on")
    }
    
    func pop() {
        print("Popcorn Popper popping popcorn!")
    }
    
    func off() {
        print("Popcorn Popper off")
    }
}

//: Configuring the components

let tuner = Tuner()
let dvd = DvdPlayer()
let cd = CdPlayer()
let amp = Amplifier(tuner: tuner, dvdPlayer: dvd, cdPlayer: cd)
let projector = Projector(dvdPlayer: dvd)
let lights = TheaterLights()
let screen = Screen()
let popper = PopcornPopper()

/* Watching a movie (the hard way!)
let movie = ""

popper.on()
popper.pop()
lights.dim(10)
screen.down()
projector.on()
projector.wideScreenMode()
amp.on()
amp.setDvd(dvd)
amp.setSurroundSound()
amp.setVolume(5)
dvd.on()
dvd.play(movie)
*/

//: Implementing the simplified interface

class HomeTheaterFacade {
    let amp: Amplifier
    let tuner: Tuner
    let dvd: DvdPlayer
    let cd: CdPlayer
    let projector: Projector
    let lights: TheaterLights
    let screen: Screen
    let popper: PopcornPopper
    
    init(amp: Amplifier, tuner: Tuner, dvd: DvdPlayer, cd: CdPlayer, projector: Projector, lights: TheaterLights, screen: Screen, popper: PopcornPopper) {
        self.amp = amp
        self.tuner = tuner
        self.dvd = dvd
        self.cd = cd
        self.projector = projector
        self.lights = lights
        self.screen = screen
        self.popper = popper
    }
    
    func watchMovie(_ movie: String) {
        print("Get ready to watch a movie...")
        popper.on()
        popper.pop()
        lights.dim(10)
        screen.down()
        projector.on()
        projector.wideScreenMode()
        amp.on()
        amp.setDvd(dvd)
        amp.setSurroundSound()
        amp.setVolume(5)
        dvd.on()
        dvd.play(movie)
    }
    
    func endMovie() {
        print("Shutting movie theater down...")
        popper.off()
        lights.on()
        screen.up()
        projector.off()
        amp.off()
        dvd.stop()
        dvd.eject()
        dvd.off()
    }
}

//: Time to watch a movie (the easy way)


let homeTheater = HomeTheaterFacade(amp: amp, tuner: tuner, dvd: dvd, cd: cd, projector: projector, lights: lights, screen: screen, popper: popper)

homeTheater.watchMovie("Raiders of the Lost Ark")
homeTheater.endMovie()

//: [Next](@next)
