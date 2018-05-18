//: [Previous](@previous)
//: ## The DJ model, view and controller

// IN SWIFT: no need to declare initialize or observer methods.
protocol BeatModelInterface {

    func on()
    
    func off()
    
    var bpm: Int { get set }

}

// Observer notification signatures
let observeBeat = "observeBeat"
let observeBPM = "observeBPM"

class BeatModel: BeatModelInterface {
    
    
    init() {
        setupAudio()
        startAudio()
    }
    
    func on() {
        print("Starting the sequencer")
    }
    
    func off() {
        print("Stopping the sequencer")
    }
    
    var bpm: Int = 90
    
    func setupAudio() {
        
    }
    
    func startAudio() {
        
    }
}

//: [Next](@next)
