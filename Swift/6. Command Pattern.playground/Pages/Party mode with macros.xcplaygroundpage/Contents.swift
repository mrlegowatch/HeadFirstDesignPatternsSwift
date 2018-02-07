//: [Previous](@previous)
//: # Party mode with macros
//: ## Using a macro command
//:
//: *Prerequisite: carry forward classes used for this section.*

protocol Command {
    func execute()
    func undo()
}

class NoCommand: Command {
    func execute() { }
    func undo() { }
}

class RemoteControlWithUndo {
    var onCommands: [Command] = []
    var offCommands: [Command] = []
    var undoCommand: Command
    
    init() {
        let noCommand = NoCommand()
        onCommands = [Command](repeating: noCommand, count: 7)
        offCommands = [Command](repeating: noCommand, count: 7)
        undoCommand = noCommand
    }
    
    func setCommand(slot: Int, on onCommand: Command, off offCommand: Command) {
        onCommands[slot] = onCommand
        offCommands[slot] = offCommand
    }
    
    func onButtonWasPushed(slot: Int) {
        onCommands[slot].execute()
        undoCommand = onCommands[slot]
    }
    
    func offButtonWasPushed(slot: Int) {
        offCommands[slot].execute()
        undoCommand = offCommands[slot]
    }
    
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

//: The Light

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
        light.on()
    }
}

//: Garage door

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

//: Stereo

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

//: Ceiling fan

class CeilingFan {
    let name: String
    
    enum Speed {
        case off
        case low
        case medium
        case high
    }
    
    var speed: Speed = .off {
        didSet {
            let isOn = (speed != .off)
            let state = isOn ? "on \(speed)" : "off"
            print("\(name) Ceiling Fan is \(state)")
        }
    }
    
    init(_ name: String) {
        self.name = name
    }
    
}

class CeilingFanSetSpeedCommand: Command {
    let ceilingFan: CeilingFan
    let newSpeed: CeilingFan.Speed
    var previousSpeed: CeilingFan.Speed!
    
    init(_ ceilingFan: CeilingFan, speed: CeilingFan.Speed) {
        self.ceilingFan = ceilingFan
        self.newSpeed = speed
    }
    
    func execute() {
        self.previousSpeed = ceilingFan.speed
        ceilingFan.speed = newSpeed
    }
    
    func undo() {
        ceilingFan.speed = previousSpeed
    }
}

class CeilingFanHighCommand: CeilingFanSetSpeedCommand {
    init(_ ceilingFan: CeilingFan) {
        super.init(ceilingFan, speed: .high)
    }
}

class CeilingFanMediumCommand: CeilingFanSetSpeedCommand {
    init(_ ceilingFan: CeilingFan) {
        super.init(ceilingFan, speed: .medium)
    }
}

class CeilingFanLowCommand: CeilingFanSetSpeedCommand {
    init(_ ceilingFan: CeilingFan) {
        super.init(ceilingFan, speed: .low)
    }
}

class CeilingFanOffCommand: CeilingFanSetSpeedCommand {
    init(_ ceilingFan: CeilingFan) {
        super.init(ceilingFan, speed: .off)
    }
}

//: TV

class TV {
    let name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    func on() {
        print("TV is on")
    }
    
    func off() {
        print("TV is off")
    }
    
}

class TVOnCommand: Command {
    var tv: TV
    
    init(_ tv: TV) {
        self.tv = tv
    }
    func execute() {
        tv.on()
    }
    
    func undo() {
        tv.off()
    }
}

class TVOffCommand: Command {
    var tv: TV
    
    init(_ tv: TV) {
        self.tv = tv
    }
    func execute() {
        tv.off()
    }
    
    func undo() {
        tv.on()
    }
}

//: Hot tub

class HotTub {
    
    init() {
    }
    
    func on() {
        print("Hot tub is on")
    }
    
    func off() {
        print("Hot tub is off")
    }
}

class HotTubOnCommand: Command {
    var hotTub: HotTub
    
    init(_ hotTub: HotTub) {
        self.hotTub = hotTub
    }
    
    func execute() {
        hotTub.on()
    }
    
    func undo() {
        hotTub.off()
    }
}

class HotTubOffCommand: Command {
    var hotTub: HotTub
    
    init(_ hotTub: HotTub) {
        self.hotTub = hotTub
    }
    
    func execute() {
        hotTub.off()
    }
    
    func undo() {
        hotTub.on()
    }
}

//: Macro command

// Mary's idea is to make a new kind of Command that can execute other Commands... and more than one of them! Pretty good idea, huh?
class MacroCommand: Command {
    let commands: [Command]
    
    init(_ commands: [Command]) {
        // Take an array of Commands and store them in the Macro command
        self.commands = commands
    }
    
    func execute() {
        for command in commands {
            // When the macro gets executed by the remote, execute those commands one at a time.
            command.execute()
        }
    }
    
    // IN SWIFT: we include the undo() implementation here to satisfy the compiler, which is discussed later.
    // When I implement undo here, I want to make sure I "undo" the commands in reverse order.
    func undo() {
        for command in commands.reversed() {
            command.undo()
        }
    }
}

//: First we create the set of commands we want to go into the macro:

let remoteControl = RemoteControlWithUndo()

// Create all the devices: a light, tv, stereo and hot tub.
let light = Light("Living Room")
let tv = TV("Living Room")
let stereo = Stereo("Living Room")
let hotTub = HotTub()

// Now create all the On and Off commands to control them.
let lightOn = LightOnCommand(light)
let lightOff = LightOffCommand(light)
let tvOn = TVOnCommand(tv)
let tvOff = TVOffCommand(tv)
let stereoOn = StereoOnWithCDCommand(stereo)
let stereoOff = StereoOffCommand(stereo)
let hotTubOn = HotTubOnCommand(hotTub)
let hotTubOff = HotTubOffCommand(hotTub)

// Create an array for On and an array for Off commands.
let partyOn: [Command] = [lightOn, stereoOn, tvOn, hotTubOn]
let partyOff: [Command] = [lightOff, stereoOff, tvOff, hotTubOff]

// ... and create two corresponding macros to hold them.
let partyOnMacro = MacroCommand(partyOn)
let partyOffMacro = MacroCommand(partyOff)

// Assign the macro to a button as we would any command.
remoteControl.setCommand(slot: 0, on: partyOnMacro, off: partyOffMacro)

//: Finally, we just need ot push some buttons and see if this works.

print("\(remoteControl)")
print("--------- Pushing Macro On ---------")
remoteControl.onButtonWasPushed(slot: 0)
print("--------- Pushing Macro Off --------")
remoteControl.offButtonWasPushed(slot: 0)

//: [Next](@next)
