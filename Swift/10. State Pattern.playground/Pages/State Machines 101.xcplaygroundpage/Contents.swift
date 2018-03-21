//: # Chapter 10: The State Pattern
//:
//: Comments are from the Head First Design Patterns book.
//:
//: Where Swift deviates from the book, the annotation "IN SWIFT" is used in the comment.
//:
//: ## State machines 101

class GumballMachine {
    
    // IN SWIFT: Use an enum.
    enum State {
        case soldOut
        case noQuarter
        case hasQuarter
        case sold
    }
    
    var state: State
    
    var count: Int
    
    init(_ count: Int) {
        self.count = count
        self.state = (count > 0) ? .noQuarter : .soldOut
    }
    
    func insertQuarter() {
        switch state {
        case .hasQuarter:
            print("You can't insert another quarter.")
        case .noQuarter:
            state = .hasQuarter
            print("You inserted a quarter.")
        case .soldOut:
            print("You can't insert a quarter, the machine is sold out.")
        case .sold:
            print("Please wait, we're already giving you a gumball.")
        }
    }
    
    func ejectQuarter() {
        switch state {
        case .hasQuarter:
            state = .noQuarter
            print("Quarter returned.")
        case .noQuarter:
            print("You haven't inserted a quarter.")
        case .sold:
            print("Sorry, you already turned the crank.")
        case .soldOut:
            print("You can't eject, you haven't inserted a quarter yet.")
        }
    }
    
    func turnCrank() {
        switch state {
        case .sold:
            print("Turning twice doesn't get you another gumball!")
        case .noQuarter:
            print("You turned but there's no quarter.")
        case .soldOut:
            print("You turned, but there are no gumballs.")
        case .hasQuarter:
            state = .sold
            print("You turned...")
            dispense()
        }
    }
    
    func dispense() {
        switch state {
        case .sold:
            print("A gumball comes rolling out the slot.")
            count -= 1
            if count == 0 {
                print("Oops, out of gumballs!")
                state = .soldOut
            } else {
                state = .noQuarter
            }
        case .noQuarter:
            print("You need to pay first.")
        case .soldOut:
            print("No gumball dispensed.")
        case .hasQuarter:
            print("No gumball dispensed.")
        }
    }
    
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

extension GumballMachine: CustomStringConvertible {
    var description: String {
        let company = "Mighty Gumball Inc."
        let model = "Swift-enabled Standing Gumball Model #2018"
        let inventory = "Inventory: \(count) gumball" + ((count != 1) ? "s" : "")
        let status = "Machine is \(state)"
        return "\n\(company)\n\(model)\n\(inventory)\n\(status)\n"
    }
}

//: In-house testing

let gumballMachine = GumballMachine(5)
print(gumballMachine)

gumballMachine.insertQuarter()
gumballMachine.turnCrank()

print(gumballMachine)

gumballMachine.insertQuarter()
gumballMachine.ejectQuarter()
gumballMachine.turnCrank()

print(gumballMachine)

gumballMachine.insertQuarter()
gumballMachine.turnCrank()
gumballMachine.insertQuarter()
gumballMachine.turnCrank()
gumballMachine.ejectQuarter()

print(gumballMachine)

gumballMachine.insertQuarter()
gumballMachine.insertQuarter()
gumballMachine.turnCrank()
gumballMachine.insertQuarter()
gumballMachine.turnCrank()
gumballMachine.insertQuarter()
gumballMachine.turnCrank()

print(gumballMachine)

//: [Next](@next)
