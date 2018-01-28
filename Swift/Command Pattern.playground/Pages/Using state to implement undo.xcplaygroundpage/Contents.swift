//: [Previous](@previous)
//: # Using state to implement Undo
//:
//: *Prerequisite: the Command interface*
protocol Command {
    func execute()
    func undo()
}

//: Okay, implementing undo on the Light was instructive but a little too easy. Typically, we need to manage a bit of state to implement undo. Let's try something a little more interesting, like the CeilingFan from the vendor classes. The CeilingFan allows a number of speeds to be set along with an off method.
//:
//: Here's the source code for CeilingFan:

class CeilingFan {
    // IN SWIFT: minor inconsistency, this is the first time we see the book use "location". I chose "name" because we needed something in an earlier section of this chapter.
    let name: String
    
    // IN SWIFT: Use an enum rather than individual int constants.
    enum Speed {
        case off
        case low
        case medium
        case high
    }
    
    // Notice that the CielingFan class holds local state representing the speed of the ceiling fan.
    var speed: Speed = .off {
        // IN SWIFT: the setter replaces all of the methods to set the speed of the ceiling fan.
        // IN SWIFT: the getter substitutes for getSpeed().
        // IN SWIFT: didSet handles printing the current state.
        didSet {
            let isOn = (speed != .off)
            let state = isOn ? "on \(speed)" : "off"
            print("\(name) Ceiling Fan is \(state)")
        }
    }
    
    init(_ name: String) {
        self.name = name
    }
    
    // These methods set the speed of the ceiling fan.
    /* IN SWIFT: This is insufficient abstraction.
     func high() {
     speed = .high
     }
     
     func medium() {
     speed = .medium
     }
     
     func low() {
     speed = .low
     }
     
     func off() {
     speed = .off
     }
     
     func getSpeed() -> Speed {
     return speed
     }
     */
}

/* IN SWIFT: This is insufficient abstraction.
 class CeilingFanHighCommand: Command {
 let ceilingFan: CeilingFan
 var previousSpeed: CeilingFan.Speed!
 
 init(_ ceilingFan: CeilingFan) {
 self.ceilingFan = ceilingFan
 }
 
 func execute() {
 previousSpeed = ceilingFan.speed
 ceilingFan.high()
 }
 
 func undo() {
 ceilingFan.speed = previousSpeed
 }
 }
 */

// IN SWIFT: we create a base class to store the new speed.
class CeilingFanSetSpeedCommand: Command {
    let ceilingFan: CeilingFan
    let newSpeed: CeilingFan.Speed
    // We've added local state to keep track of the previous speed of the fan.
    var previousSpeed: CeilingFan.Speed!
    
    init(_ ceilingFan: CeilingFan, speed: CeilingFan.Speed) {
        self.ceilingFan = ceilingFan
        self.newSpeed = speed
    }
    
    func execute() {
        // In execute, before we change the speed of the fan, we need to first record its previous state, just in case we need to undo our actions.
        self.previousSpeed = ceilingFan.speed
        ceilingFan.speed = newSpeed
    }
    
    func undo() {
        // To undo, we set the speed of the fan back to its previous speed.
        /* IN SWIFT: It was this "if" statement that prompted me to implement an enum in place of the constants. Either enum was not available, or not used widely, in Java, at the time the book was initially written.
         if previousSpeed == .high {
         ceilingFan.high()
         } else if previousSpeed == .medium {
         ceilingFan.medium()
         } else if previousSpeed == .low {
         ceilingFan.low()
         } else if previousSpeed == .off {
         ceilingFan.off();
         }
         */
        ceilingFan.speed = previousSpeed
    }
}

// IN SWIFT: the commands can now be implemented as subclasses of CeilingFanSetSpeedCommand, passing the speed to the base class. The base class handles both execute() and undo(), and there is less code duplication.
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

//: ## Getting ready to test the ceiling fan
//: *Prerequisite: carry forward the RemoteControlWithUndo and NoCommand classes.*

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

//: Time to load up our remote control with the ceiling fan commands. We are going to load slot 0's on button with the medium setting for the fan, and slot 1 with the high setting. Both corresponding off buttons will hold the ceiling fan off command.
//:
//: Here's our test script:

let remoteControl = RemoteControlWithUndo()

let ceilingFan = CeilingFan("Living Room")

// Here we instantiate three commands: high, medium and off.
let ceilingFanMedium = CeilingFanMediumCommand(ceilingFan)
let ceilingFanHigh = CeilingFanHighCommand(ceilingFan)
let ceilingFanOff = CeilingFanOffCommand(ceilingFan)

// Here we put medium in slot 0, and high in slot 1. We also load up the off command.
remoteControl.setCommand(slot: 0, on: ceilingFanMedium, off: ceilingFanOff)
remoteControl.setCommand(slot: 1, on: ceilingFanHigh, off: ceilingFanOff)

// First, turn the fan on medium. Then turn it off.
remoteControl.onButtonWasPushed(slot: 0)
remoteControl.offButtonWasPushed(slot: 0)
print("\(remoteControl)")

// Undo! It should go back to medium...
remoteControl.undoButtonWasPushed()

// Turn it on to high this time.
remoteControl.onButtonWasPushed(slot: 1)
print("\(remoteControl)")

// And, one more undo; it should go back to medium.
remoteControl.undoButtonWasPushed()

//: [Next](@next)
