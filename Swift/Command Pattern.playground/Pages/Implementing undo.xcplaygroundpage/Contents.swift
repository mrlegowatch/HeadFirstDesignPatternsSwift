//: [Previous](@previous)
//: # Implementing Undo
//:
//: Okay, we need to add functionality to support the undo button on the remote.
//:
//: When commands support undo, they have an undo() method that mirrors the execute() method. Whatever execute() last did, undo() reverses. So, before we can add undo to our commands, we need to add an undo() method to the Command interface.

protocol Command {
    func execute()
    
    // Here's the new undo() method.
    func undo()
}

//: Now let's dive into the Light command and implement the undo() method.

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
    
    func undo() {
        // execute() turns the light on, so undo() simply turns the light back off.
        light.off()
    }
}

class LightOffCommand: Command {
    var light: Light
    
    init(_ light: Light) {
        self.light = light
    }
    
    func execute() {
        light.off()
    }
    
    func undo() {
        // And here, undo() turns the light back on.
        light.on()
    }
}

class NoCommand: Command {
    func execute() { }
    func undo() { }
}

class RemoteControlWithUndo {
    var onCommands: [Command] = []
    var offCommands: [Command] = []
    // This is where we'll stash the last command executed for the undo button.
    // IN SWIFT: we could declare this as Command?, and use undoCommand?.undo() to achieve the same effect.
    var undoCommand: Command
    
    init() {
        let noCommand = NoCommand()
        onCommands = [Command](repeating: noCommand, count: 7)
        offCommands = [Command](repeating: noCommand, count: 7)
        // Just like the other slots, undo starts off with a NoCommand, so pressing undo before any other button won't do anything at all.
        undoCommand = noCommand
    }
    
    func setCommand(slot: Int, on onCommand: Command, off offCommand: Command) {
        onCommands[slot] = onCommand
        offCommands[slot] = offCommand
    }
    
    // When a button is pressed, we take the command and first execute it; then we save a reference to it in the undoCommand instance variable. We do this for both "on" commands and "off" commands.
    func onButtonWasPushed(slot: Int) {
        onCommands[slot].execute()
        undoCommand = onCommands[slot]
    }
    
    func offButtonWasPushed(slot: Int) {
        offCommands[slot].execute()
        undoCommand = offCommands[slot]
    }
    
    // When the undo button is pressed, we invoke the undo() method of the command stored in undoCommand. This reverses the operation of the last command executed.
    func undoButtonWasPushed() {
        undoCommand.undo()
    }
}

extension RemoteControlWithUndo: CustomStringConvertible {
    
    var description: String {
        var desc = "\n----------- Remote Control -----------\n"
        for index in 0..<onCommands.count {
            desc += "[slot \(index)] \(type(of: onCommands[index]))    \(type(of:offCommands[index]))\n"
        }
        desc += "[undo] \(type(of: undoCommand))"
        return desc
    }
}

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
    
    func undo() {
        garageDoor.down()
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
    
    func undo() {
        garageDoor.up()
    }
}

//: ## Stereo

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
        self.stereo = stereo
    }
    
    func execute() {
        stereo.on()
        stereo.setCD()
        stereo.setVolume(11)
    }
    
    func undo() {
        stereo.off()
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
    
    func undo() {
        stereo.on()
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
    
    func undo() {
        ceilingFan.off()
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
    
    func undo() {
        ceilingFan.on()
    }
}

//: ## Time to QA that undo button!


let remoteControl = RemoteControlWithUndo()

// Create a Light, and our new undo() enabled Light On and Off Commands.
let livingRoomLight = Light("Living Room")
let livingRoomLightOn = LightOnCommand(livingRoomLight)
let livingRoomLightOff = LightOffCommand(livingRoomLight)

// Add the light Commands to the remote in slot 0.
remoteControl.setCommand(slot: 0, on: livingRoomLightOn, off: livingRoomLightOff)

// Turn the light onn, then off and then undo.
remoteControl.onButtonWasPushed(slot: 0)
remoteControl.offButtonWasPushed(slot: 0)
print("\(remoteControl)")
remoteControl.undoButtonWasPushed()

// Then, turn the light off, back on, and undo.
remoteControl.offButtonWasPushed(slot: 0)
remoteControl.onButtonWasPushed(slot: 0)
print("\(remoteControl)")
remoteControl.undoButtonWasPushed()

//: [Next](@next)
