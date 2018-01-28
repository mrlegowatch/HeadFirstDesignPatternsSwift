//: [Previous](@previous)
//: # Simplifying the Remote Control with lambda expressions
//: ## Step 1: Create the receiver
//: This step is exactly the same as before.

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

let livingRoomLight = Light("Living Room:")

//: ## Step 2: Set the remote control's commands using lambda expressions

// Swift doesn't perform the kind of magic Java does, so this won't work for parameters of type Command:
//let remoteControl = RemoteControl()
//remoteControl.setCommand(slot: 0, on: { livingRoomLight.on() }, off: { livingRoomLight.off() })

//: Simplifying even more with method references

// This also doesn't work in Swift:
//remoteControl.setCommand(slot: 0, on: livingRoomLight.on, off: livingRoomLight.off)

//: So. That fell off the rails quickly in Swift. And the Q&A explains partly why:
//:
//: Q. You keep saying that a lambda expression must match a method in an interface with one, and only one, method. So if an interface has two methods, we can't use a lambda expression?
//:
//: A. That's right. [The rest snipped]
//:
//: Also notice that using lambdas in Java means limiting the functions in the Command class to one:
//:
//: Q. Does that mean we can't use lambda expressions for our Remote Control implementation with undo? There, our Command interface has two methods: execute() and undo().
//:
//: A. That's right. [The rest snipped]
//:
//: Here might be an alternative solution in Swift, that carries the same limitations as the Java lambda.

// Instead of a Command object with a single method with no arguments and no return values, declare a function signature
// IN SWIFT, this is called a Closure (a lambda that can capture and use state in the context in which it is defined, e.g., a nested function).
//protocol Command {
//    func execute()
//}
typealias Command = () -> ()

// And, instead of a NoCommand object, just use an empty lambda when initalizing the RemoteControl.
//class NoCommand: Command {
//    func execute() { }
//}


// Limitations: no undo.
// Swift requirement: must declare setCommand parameters as "@escaping", because the closure being passed in will outlive the context of the call to setCommand (it's going to be stored in RemoteControl's onCommands or offCommands) and the compiler can't determine if RemoteControl will outlive the Commands or not (which will be destructed first?).
class RemoteControl {
    var onCommands: [Command] = []
    var offCommands: [Command] = []
    
    init() {
        // IN SWIFT: The explanation for this came later, after the test.
        // We've removed the code to create a NoCommand object.
        // Instead of a NoCommand object, we use a lambda expression that does nothing! (Just like the execute() method of the NoCommand object did nothing.)
        onCommands = [Command](repeating: { }, count: 7)
        offCommands = [Command](repeating: { }, count: 7)
    }
    
    func setCommand(slot: Int, on onCommand: @escaping Command, off offCommand: @escaping Command) {
        onCommands[slot] = onCommand
        offCommands[slot] = offCommand
    }
    
    func onButtonWasPushed(slot: Int) {
        onCommands[slot]()
    }
    
    func offButtonWasPushed(slot: Int) {
        offCommands[slot]()
    }
    
}

extension RemoteControl: CustomStringConvertible {
    
    // Note: in Swift, a lambda is printed as its signature, "() -> ()" so this isn't useful.
    var description: String {
        var desc = "\n----------- Remote Control -----------\n"
        for index in 0..<onCommands.count {
            desc += "[slot \(index)] \(type(of: onCommands[index]))    \(type(of:offCommands[index]))\n"
        }
        return desc
    }
}

//: ## Let's try Step 2 again

let remoteControl = RemoteControl()

// Here are the two lambda expressions
remoteControl.setCommand(slot: 0, on: { livingRoomLight.on() }, off: { livingRoomLight.off() })
print("\(remoteControl)")

remoteControl.onButtonWasPushed(slot: 0)
remoteControl.offButtonWasPushed(slot: 0)

// These are references to the on() and off() methods of the livingRoomLight object.
remoteControl.setCommand(slot: 0, on: livingRoomLight.on, off: livingRoomLight.off)
print("\(remoteControl)")

remoteControl.onButtonWasPushed(slot: 0)
remoteControl.offButtonWasPushed(slot: 0)

//: ## What if we need to do more than one thing in our lambda expression?

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

let stereo = Stereo("Living Room")
let stereoOnWithCD = { stereo.on(); stereo.setCD(); stereo.setVolume(11) }

remoteControl.setCommand(slot: 3, on: stereoOnWithCD, off: stereo.off)

// IN SWIFT: Instead of declaring a function lambda in the context of a stereo instance (above), we might make an extension of Stereo, and use that instead:
extension Stereo {
    func onWithCD() {
        on()
        setCD()
        setVolume(11)
    }
}

remoteControl.setCommand(slot: 3, on: stereo.onWithCD, off: stereo.off)

//: ## Test the remote control with lambda expressions

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

let kitchenLight = Light("Kitchen")
let ceilingFan = CeilingFan("Living Room")
let garageDoor = GarageDoor("Main house")

// We've removed all the code to create concrete Command objects (and we deleted all those classes too). Now our code's a lot more concise( and we've gone from 22 classes to 9).
// We're using method references everywhere we have simple one-method commands, and a full lambda expression for where we need to do more than one method call.
remoteControl.setCommand(slot: 0, on: livingRoomLight.on, off: livingRoomLight.off)
remoteControl.setCommand(slot: 1, on: kitchenLight.on, off: kitchenLight.off)
remoteControl.setCommand(slot: 2, on: { ceilingFan.speed = .high }, off: { ceilingFan.speed = .off })
remoteControl.setCommand(slot: 3, on: stereoOnWithCD, off: stereo.off)
remoteControl.setCommand(slot: 4, on: garageDoor.up, off: garageDoor.down)

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
