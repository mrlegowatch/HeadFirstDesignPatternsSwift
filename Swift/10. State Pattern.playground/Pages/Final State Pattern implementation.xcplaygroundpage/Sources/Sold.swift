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
