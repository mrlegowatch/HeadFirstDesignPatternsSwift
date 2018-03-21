//: [Previous](@previous)
//: ## We still need to finish the Gumball 1 in 10 game

protocol State {
    func insertQuarter()
    
    func ejectQuarter()
    
    func turnCrank()
    
    func dispense()
}

class NoQuarter: State {
    // IN SWIFT: make reference weak, to avoid a strong circular dependency.
    // Instances of this class is created and destroyed within the lifetime of the gumball machine, and the gumball machine is responsible for the lifetime of instances of this, so this should be the one that holds a weak reference.
    weak var gumballMachine: GumballMachine!
    
    init(_ gumballMachine: GumballMachine) {
        self.gumballMachine = gumballMachine
    }
    
    func insertQuarter() {
        print("You inserted a quarter.")
        gumballMachine.setState(gumballMachine.hasQuarter)
    }
    
    func ejectQuarter() {
        print("You haven't inserted a quarter.")
    }
    
    func turnCrank() {
        print("You turned, but there's no quarter.")
    }
    
    func dispense() {
        print("You need to pay first.")
    }
    
}

extension NoQuarter: CustomStringConvertible {
    var description: String {
        return "waiting for quarter"
    }
}

class HasQuarter: State {
    weak var gumballMachine: GumballMachine!
    var randomWinner = Random()
    
    init(_ gumballMachine: GumballMachine) {
        self.gumballMachine = gumballMachine
    }
    
    func insertQuarter() {
        print("You can't insert another quarter.")
    }
    
    func ejectQuarter() {
        print("Quarter returned.")
        gumballMachine.setState(gumballMachine.noQuarter)
    }
    
    func turnCrank() {
        print("You turned...")
        let winner = randomWinner.nextInt(10)
        if winner == 0 && gumballMachine.count > 1 {
            gumballMachine.setState(gumballMachine.winner)
        } else {
            gumballMachine.setState(gumballMachine.sold)
        }
    }
    
    func dispense() {
        print("No gumball dispensed.")
    }
    
}

extension HasQuarter: CustomStringConvertible {
    var description: String {
        return "waiting for turn of crank"
    }
}

class Sold: State {
    weak var gumballMachine: GumballMachine!
    
    init(_ gumballMachine: GumballMachine) {
        self.gumballMachine = gumballMachine
    }
    
    func insertQuarter() {
        print("Please wait, we're already giving you a gumball.")
    }
    
    func ejectQuarter() {
        print("Sorry, you already turned the crank.")
    }
    
    func turnCrank() {
        print("Turning twice doesn't get you another gumball!")
    }
    
    func dispense() {
        gumballMachine.releaseBall()
        if gumballMachine.count > 0 {
            gumballMachine.setState(gumballMachine.noQuarter)
        } else {
            print("Oops, out of gumballs!")
            gumballMachine.setState(gumballMachine.soldOut)
        }
    }
}

extension Sold: CustomStringConvertible {
    var description: String {
        return "delivering a gumball"
    }
}

class SoldOut: State {
    weak var gumballMachine: GumballMachine!
    
    init(_ gumballMachine: GumballMachine) {
        self.gumballMachine = gumballMachine
    }
    
    func insertQuarter() {
        print("You can't insert a quarter, the machine is sold out.")
    }
    
    func ejectQuarter() {
        print("You can't eject, you haven't inserted a quarter yet.")
    }
    
    func turnCrank() {
        print("You turned, but there are no gumballs.")
    }
    
    func dispense() {
        print("No gumball dispensed.")
    }
    
}

extension SoldOut: CustomStringConvertible {
    var description: String {
        return "sold out"
    }
}

class Winner: State {
    weak var gumballMachine: GumballMachine!
    
    init(_ gumballMachine: GumballMachine) {
        self.gumballMachine = gumballMachine
    }

    func insertQuarter() {
        print("Please wait, we're already giving you a gumball.")
    }
    
    func ejectQuarter() {
        print("Sorry, you already turned the crank.")
    }
    
    func turnCrank() {
        print("Turning twice doesn't get you another gumball!")
    }

    func dispense() {
        gumballMachine.releaseBall()
        if gumballMachine.count == 0 {
            gumballMachine.setState(gumballMachine.soldOut)
        } else {
            print("YOU'RE A WINNER! You got two gumballs for your quarter.")
            if gumballMachine.count > 0 {
                gumballMachine.setState(gumballMachine.noQuarter)
            } else {
                print("Oops, out of gumballs!")
                gumballMachine.setState(gumballMachine.soldOut)
            }
        }
    }
    
}

extension Winner: CustomStringConvertible {
    var description: String {
        return "WINNER!"
    }
}

class GumballMachine {
    
    // Code smell: requiring public references to subclasses of State exposes implementation details to clients. Consider using base type for public references, or an enum that internally maps to subclasses.
    var hasQuarter: State!
    var noQuarter: State!
    var sold: State!
    var soldOut: State!
    var winner: State!
    
    var state: State!
    var count: Int
    
    init(_ numberGumballs: Int) {
        self.count = numberGumballs
        
        hasQuarter = HasQuarter(self)
        noQuarter = NoQuarter(self)
        sold = Sold(self)
        soldOut = SoldOut(self)
        winner = Winner(self)
        
        state = (numberGumballs > 0) ? noQuarter : soldOut
    }
    
    // Code smell: If this class needs to conform to State, should it derive from State so its methods are required to match? Exception: we call dispense() directly from turnCrank().
    func insertQuarter() {
        state.insertQuarter()
    }
    
    func ejectQuarter() {
        state.ejectQuarter()
    }
    
    func turnCrank() {
        state.turnCrank()
        state.dispense()
    }
    
    // Code smell: setter using another data member as argument screams for abstraction.
    func setState(_ state: State) {
        self.state = state
    }
    
    func releaseBall() {
        print("A gumball comes rolling out the slot...")
        if count != 0 {
            count -= 1
        }
    }
    
}

extension GumballMachine: CustomStringConvertible {
    var description: String {
        let company = "Mighty Gumball Inc."
        let model = "Swift-enabled Standing Gumball Model #2018"
        let inventory = "Inventory: \(count) gumball" + ((count != 1) ? "s" : "")
        let status = "Machine is \(state!)"
        return "\n\(company)\n\(model)\n\(inventory)\n\(status)\n"
    }
}

//: ### Demo for the CEO of Mighty Gumball, Inc.

let gumballMachine = GumballMachine(20)

print(gumballMachine)

gumballMachine.insertQuarter()
gumballMachine.turnCrank()

print(gumballMachine)

gumballMachine.insertQuarter()
gumballMachine.turnCrank()
gumballMachine.insertQuarter()
gumballMachine.turnCrank()

print(gumballMachine)

gumballMachine.insertQuarter()
gumballMachine.turnCrank()
gumballMachine.insertQuarter()
gumballMachine.turnCrank()

print(gumballMachine)

gumballMachine.insertQuarter()
gumballMachine.turnCrank()
gumballMachine.insertQuarter()
gumballMachine.turnCrank()

print(gumballMachine)

gumballMachine.insertQuarter()
gumballMachine.turnCrank()
gumballMachine.insertQuarter()
gumballMachine.turnCrank()

print(gumballMachine)

gumballMachine.insertQuarter()
gumballMachine.turnCrank()
gumballMachine.insertQuarter()
gumballMachine.turnCrank()

print(gumballMachine)

gumballMachine.insertQuarter()
gumballMachine.turnCrank()
gumballMachine.insertQuarter()
gumballMachine.turnCrank()

print(gumballMachine)

gumballMachine.insertQuarter()
gumballMachine.turnCrank()
gumballMachine.insertQuarter()
gumballMachine.turnCrank()

print(gumballMachine)

//: [Next](@next)
