//: [Previous](@previous)
//: # The final undo implementation
//:
//: The final undo implementation places the relevant code in source files, and the playground takes the role of just running the test.
//:
//: In this Swift implementation, additional state is implemented using enums with values, to help reduce Command subclass proliferation. This has a side-effect of leaking some implementation details into the interfaces of the commands.

let remoteControl = RemoteControlWithUndo()

let livingRoomLight = Light("Living Room")

let livingRoomLightOn = LightOnCommand(livingRoomLight)
let livingRoomLightOff = LightOffCommand(livingRoomLight)

remoteControl.setCommand(slot: 0, on: livingRoomLightOn, off: livingRoomLightOff)

remoteControl.onButtonWasPushed(slot: 0)
remoteControl.offButtonWasPushed(slot: 0)
print(remoteControl)
remoteControl.undoButtonWasPushed()
remoteControl.offButtonWasPushed(slot: 0)
remoteControl.onButtonWasPushed(slot: 0)
print(remoteControl)
remoteControl.undoButtonWasPushed()

let ceilingFan = CeilingFan("Living Room")

let ceilingFanMedium = CeilingFanCommand(ceilingFan, speed: .medium)
let ceilingFanHigh = CeilingFanCommand(ceilingFan, speed: .high)
let ceilingFanOff = CeilingFanCommand(ceilingFan, speed: .off)

remoteControl.setCommand(slot: 0, on: ceilingFanMedium, off: ceilingFanOff)
remoteControl.setCommand(slot: 1, on: ceilingFanHigh, off: ceilingFanOff)

remoteControl.onButtonWasPushed(slot: 0)
remoteControl.offButtonWasPushed(slot: 0)
print(remoteControl)
remoteControl.undoButtonWasPushed()

remoteControl.onButtonWasPushed(slot: 1)
print(remoteControl)
remoteControl.undoButtonWasPushed()

//: The following demonstrates the use of the macro command with undo.

// Create all the devices: a light, tv, stereo and hot tub.
let light = Light("Living Room")
let tv = TV("Living Room")
let stereo = Stereo("Living Room")
let hotTub = HotTub("Back Yard")

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
remoteControl.setCommand(slot: 2, on: partyOnMacro, off: partyOffMacro)

//: Finally, we just need ot push some buttons and see if this works.

print()
print("\(remoteControl)")
print("--------- Pushing Macro On ---------")
remoteControl.onButtonWasPushed(slot: 2)
print("--------- Pushing Macro Off --------")
remoteControl.offButtonWasPushed(slot: 2)

//: [Next](@next)
