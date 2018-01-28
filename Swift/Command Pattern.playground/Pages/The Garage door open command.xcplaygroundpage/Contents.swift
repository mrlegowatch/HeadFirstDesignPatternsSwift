//: [Previous](@previous)
//: # Sharpen your pencil: The Garage door open command

// Carried over from the previous section
protocol Command {
    func execute()
}

class Light {

    func on() {
        print("Light is on")
    }
    
    func off() {
        print("Light is off")
    }
}

class LightOnCommand: Command {
    var light: Light
    
    init(_ light: Light) {
        self.light = light
    }
    
    func execute() {
        light.on()
    }
}

class SimpleRemoteControl {
    var slot: Command!
    
    init() { }
    
    func set(command: Command) {
        slot = command
    }
    
    func buttonWasPressed() {
        slot.execute()
    }
}

//: ## GarageDoor
//: Okay, it's time for you to implement the GarageDoorOpenCommand class. First, supply the code for the class below. You'll neeed the GarageDoor class diagram.
//:

class GarageDoor {
  
    var light = Light()
    
    func up() {
        print("Garage door is open")
    }
    
    func down() {
        print("Garage door is closed")
    }
    
    func stop() {
        print("Stopping")
    }
    
    func lightOn() {
        light.on()
    }
    
    func lightOff() {
        light.off()
    }
}

//: ## The GarageDoorOpenCommand

class GarageDoorOpenCommand: Command {
    var garageDoor: GarageDoor
    
    init(_ garageDoor: GarageDoor) {
        self.garageDoor = garageDoor
    }
    
    func execute() {
        garageDoor.up()
    }
}

//: ## Remote control test

let remote = SimpleRemoteControl()
let light = Light()
let garageDoor = GarageDoor()
let lightOn = LightOnCommand(light)
let garageOpen = GarageDoorOpenCommand(garageDoor)

remote.set(command: lightOn)
remote.buttonWasPressed()
remote.set(command: garageOpen)
remote.buttonWasPressed()

//: [Next](@next)
