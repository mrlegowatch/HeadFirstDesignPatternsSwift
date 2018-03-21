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
