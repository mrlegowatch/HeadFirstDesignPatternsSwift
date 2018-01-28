//: [Previous](@previous)
//: # The Command Pattern defined
//: ## Implementing the Remote Control

// Carried over
protocol Command {
    func execute()
}

// IN SWIFT: We need to declare NoCommand before it has been explained.
// IN SWIFT: We could alternatively use [Command?] in the array declaration, and initialize slots with nil. To see an example of this, see how offCommands are implemented below.
class NoCommand: Command {
    func execute() { }
}

class RemoteControl {
    // This time aroundthe remote is going to handle seven On and Off commands, which we'll hold in corresponding arrays.
    var onCommands: [Command] = []
    var offCommands: [Command?] = []
    
    init() {
        // In the constructor all we need to do is instantiate and initialize the on and off arrays.
        let noCommand = NoCommand()
        // IN SWIFT: we use the Array(repeating:count:) constructor instead of iterating.
        onCommands = [Command](repeating: noCommand, count: 7)
        // IN SWIFT: we can use nil instead of NoCommand when an array allows optionals (e.g., [Command?])
        offCommands = [Command?](repeating: nil, count: 7)
    }
    
    // The setCommand() method takes a slot position and an On and Off command to be stored in that slot.
    func setCommand(slot: Int, on onCommand: Command, off offCommand: Command) {
        onCommands[slot] = onCommand
        offCommands[slot] = offCommand
    }
    
    // When an On or Off button is pressed, the hardware takes care of calling the corresponding methods onButtonWasPushed or offButtonWasPushed.
    // IN SWIFT: on macOS or iOS, this would likely be called from a ViewController.
    func onButtonWasPushed(slot: Int) {
        onCommands[slot].execute()
    }
    
    func offButtonWasPushed(slot: Int) {
        // IN SWIFT: since we have allowed optionals, the "do nothing" NoCommand is mimicked using ? here.
        offCommands[slot]?.execute()
    }
}

// IN SWIFT: the equivalent of Java toString() is the CustomStringConvertible protocol, which requires a `var description: String { get }` accessor.
extension RemoteControl: CustomStringConvertible {
    
    // We've overridden toString() to print out each slot and its corresponding command. You'll see us use this when we test the remote control.
    var description: String {
        var desc = "\n----------- Remote Control -----------\n"
        for index in 0..<onCommands.count {
            // IN SWIFT: to convert an optional to a string, use String(describing:) so it can print "nil" for NoCommand
            desc += "[slot \(index)] \(type(of: onCommands[index]))    \(String(describing: offCommands[index]))\n"
        }
        return desc
    }
}

//: ## The Light
//:
//: *Carrying forward `Light` and `LightOnCommand` from previous example, and adding a `name` property, because the code used to test this will require naming things.*
class Light {
    let name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    func on() {
        print("\(name) Light is On")
    }
    
    func off() {
        print("\(name) Light is Off")
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

//: # Implementing the commands
//: Well, we've already gotten our feet wet implementing the LightOnCommand for the SimpleRemoteControl. We can plug that same code in here and everything works beautifully. Off commands are no different; in fact the LightOffCommand looks like this:

class LightOffCommand: Command {
    var light: Light
    
    init(_ light: Light) {
        self.light = light
    }
    
    func execute() {
        light.off()
    }
}

//: ## Stereo
//: Let's try something a little more challenging; how about writing on and off commands for the Stereo? Okay, off is easy, we just bind the Stereo to the off() method in the StereoOffCommand. On is a little more complicated; let's say we want to write a StereoOnWithCDCommand...
//:
//: *First, we'll need to declare Stereo.*
class Stereo {
    
    let name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    func on() {
        print("\(name) Stereo is On")
    }
    
    func off() {
        print("\(name) Stereo is Off")
    }
    
    func setCD() {
        print("\(name) Stereo is set to CD")
    }
    
    func setDVD() {
        print("\(name) Stereo is set to DVD")
    }
    
    func setRadio() {
        print("\(name) Stereo is set to Radio")
    }
    
    func setVolume(_ volume: Int) {
        print("\(name) Stereo Volume is set to \(volume)")
    }
}

class StereoOnWithCDCommand: Command {
    var stereo: Stereo
    
    init(_ stereo: Stereo) {
        // Just like the LightOnCommand, we get passed the instance of the stereo we are going to be controlling and we store it in a local instance variable.
        self.stereo = stereo
    }
    
    func execute() {
        // To carry out this request, we need to call three methods on the stereo: first turn it on, then set it to play the CD, thand finally set the volume to 11. Why 11? Well, it's better than 10, right?
        stereo.on()
        stereo.setCD()
        stereo.setVolume(11)
    }
}

class StereoOffCommand: Command {
    var stereo: Stereo
    
    init(_ stereo: Stereo) {
        self.stereo = stereo
    }
    
    func execute() {
        stereo.off()
    }
}

//: Not too bad. Take a look at the rest of the vendor classes; by now you can definitely knock out the rest of the Command classes we need for those.
//: ## Garage door

class GarageDoor {
    
    var light = Light("Garage Door")
    
    init(_ name: String) {
    }
    
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

class GarageDoorUpCommand: Command {
    let garageDoor: GarageDoor
    
    init(_ garageDoor: GarageDoor) {
        self.garageDoor = garageDoor
    }
    
    func execute() {
        garageDoor.up()
    }
}

class GarageDoorDownCommand: Command {
    let garageDoor: GarageDoor
    
    init(_ garageDoor: GarageDoor) {
        self.garageDoor = garageDoor
    }
    
    func execute() {
        garageDoor.down()
    }
}

//: ## Ceiling fan

class CeilingFan {
    let name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    func on() {
        print("\(name) Ceiling Fan is On")
    }
    
    func off() {
        print("\(name) Ceiling Fan is Off")
    }
}

class CeilingFanOnCommand: Command {
    let ceilingFan: CeilingFan
    
    init(_ ceilingFan: CeilingFan) {
        self.ceilingFan = ceilingFan
    }
    
    func execute() {
        ceilingFan.on()
    }
}

class CeilingFanOffCommand: Command {
    let ceilingFan: CeilingFan
    
    init(_ ceilingFan: CeilingFan) {
        self.ceilingFan = ceilingFan
    }
    
    func execute() {
        ceilingFan.off()
    }
}

//: # Putting the Remote Control through its paces
//: ## The remote control loader

let remoteControl = RemoteControl()

// Create all the devices in their proper locations.
let livingRoomLight = Light("Living Room")
let kitchenLight = Light("Kitchen")
let ceilingFan = CeilingFan("Living Room")
let garageDoor = GarageDoor("") 
let stereo = Stereo("Living Room")

// Create all the light command objects
let livingRoomLightOn = LightOnCommand(livingRoomLight)
let livingRoomLightOff = LightOffCommand(livingRoomLight)
let kitchenLightOn = LightOnCommand(kitchenLight)
let kitchenLightOff = LightOffCommand(kitchenLight)

// Create the On and Off for the ceiling fan
let ceilingFanOn = CeilingFanOnCommand(ceilingFan)
let ceilingFanOff = CeilingFanOffCommand(ceilingFan)

// Create the Up and Down commands for the garage
let garageDoorUp = GarageDoorUpCommand(garageDoor)
let garageDoorDown = GarageDoorDownCommand(garageDoor)

// Create the stereo On and Off commands.
let stereoOnWithCD = StereoOnWithCDCommand(stereo)
let stereoOff = StereoOffCommand(stereo)

// Now that we've got all our commands, we can load them into the remote slots.
remoteControl.setCommand(slot: 0, on: livingRoomLightOn, off: livingRoomLightOff)
remoteControl.setCommand(slot: 1, on: kitchenLightOn, off: kitchenLightOff)
remoteControl.setCommand(slot: 2, on: ceilingFanOn, off: ceilingFanOff)
remoteControl.setCommand(slot: 3, on: stereoOnWithCD, off: stereoOff)

// All right, we're ready to roll! Now, we step through each slot and push its On and Off button.
print("\(remoteControl)")

remoteControl.onButtonWasPushed(slot: 0)
remoteControl.offButtonWasPushed(slot: 0)
remoteControl.onButtonWasPushed(slot: 1)
remoteControl.offButtonWasPushed(slot: 1)
remoteControl.onButtonWasPushed(slot: 2)
remoteControl.offButtonWasPushed(slot: 2)
remoteControl.onButtonWasPushed(slot: 3)
remoteControl.offButtonWasPushed(slot: 3)


//: [Next](@next)
