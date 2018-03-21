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
