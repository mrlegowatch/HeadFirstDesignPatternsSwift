//: # Chapter 11: The Proxy Pattern
//:
//: Comments are from the Head First Design Patterns book.
//:
//: Where Swift deviates from the book, the annotation "IN SWIFT" is used in the comment.
//:
//: ## Controlling Object Access
//: ### Coding the Monitor

class GumballMachine {
    // other instance variables
    
    // A location is just a string
    // IN SWIFT: we don't necessarily need to add a getter method, we can just control access using private(set) (and we can redirect get/set for properties anyway).
    private(set) var location: String
    
    // IN SWIFT: we need to implement boilerplate that the chapter doesn't provide yet, but assumes from the previous chapter on State Pattern.
    var count: Int
    
    // IN SWIFT: Use an enum.
    enum State {
        case soldOut
        case noQuarter
        case hasQuarter
        case sold
    }
    
    var state: State
    // The location is passed into the constructor and stored in the instance variable
    init(_ location: String, count: Int) {
        // other constructor code here
        self.location = location
        self.count = count
        self.state = (count > 0) ? .noQuarter : .soldOut
    }
    
    // other methods here
}

extension GumballMachine.State: CustomStringConvertible {
    var description: String {
        switch self {
        case .sold:
            return "delivering a gumball"
        case .soldOut:
            return "sold out"
        case .noQuarter:
            return "waiting for quarter"
        case .hasQuarter:
            return "waiting for turn of crank"
        }
    }
}

class GumballMonitor {
    var machine: GumballMachine
    
    // The monitor takes the machine in its constructor and assigns it to the machine instance variable.
    init(_ machine: GumballMachine) {
        self.machine = machine
    }
    
    // Our report method just prints a repot with location, inventory and the machine state.
    var report: String {
        let location = "Gumball Machine: \(machine.location)"
        let inventory = "Current inventory: \(machine.count) gumballs"
        let state = "Current state: \(machine.state)"
        return "\(location)\n\(inventory)\n\(state)"
    }
}

//: Testing the Monitor

let count = 112 // IN SWIFT: no stdin, just hardcode the example

let gumballMachine = GumballMachine("Seattle", count: count)

let monitor = GumballMonitor(gumballMachine)

print(monitor.report)
// rest of test code here


//: [Next](@next)
