//: # Chapter 6: The Command Pattern
//:
//: Comments are from the Head First Design Patterns book.
//:
//: Where Swift deviates from the book, the annotation "IN SWIFT" is used in the comment.
//:
//: ## Our first command object
//:
//: Implementing the Command interface

// IN SWIFT: a protocol is an interface.
protocol Command {
    // Simple. All we need is one method called execute().
    func execute()
}

//: ## Implementing a command to turn a light on
// The light class has two methods: on() and off().
class Light {
 
    func on() {
        print("Light is on")
    }
    
    func off() {
        print("Light is off")
    }
}

// This is a command, so we need to implement the Command interface.
class LightOnCommand: Command {
    var light: Light
    
    // The constructor is passed the specific light that this command is going to control - say the living room light - and stashes it in the light instance variable. When execute() gets called, this is the light object that is going to be the Receiver of the request.
    init(_ light: Light) {
        self.light = light
    }
    
    // The execute() method calls the on() method on the recieving object, which is the light we are controlling.
    func execute() {
        light.on()
    }
}

//: ## Using the command object
class SimpleRemoteControl {
    // We have one slot to hold our command which will control one device.
    // IN SWIFT: since slot isn't initialized when init() is called, it must be optional. To emulate Java which would throw a null pointer exception trying to use an uninitialized pointer, we use !.
    var slot: Command!
    
    init() { }
    
    // We have a method for setting the command the slot is going to control. This could be called multiple times if the client of this code wanted to change the behavior of the remote button.
    func set(command: Command) {
        slot = command
    }
    
    // This method is called when the button is pressed. All we do is take the current command bound to the slot and call its execute() method.
    func buttonWasPressed() {
        slot.execute()
    }
}

//: ## Remote control test

// This is our Client in Command Pattern-speak.

// The remote is our Invoker, it will be passed a command object that can be used to make requests.
let remote = SimpleRemoteControl()
// Now we create a Light object. This will be the Receiver of the request.
let light = Light()

// Here, create a command and pass the Receiver to it.
let lightOn = LightOnCommand(light)

// Here, pass the command to the Invoker.
remote.set(command: lightOn)

// And then we simulate the button being pressed.
remote.buttonWasPressed()

//: [Next](@next)
