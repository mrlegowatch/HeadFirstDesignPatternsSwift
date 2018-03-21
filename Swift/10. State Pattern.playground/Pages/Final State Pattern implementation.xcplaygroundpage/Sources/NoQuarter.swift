
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
