public class GumballMachine {
    
    internal private(set) var hasQuarter: State!
    internal private(set) var noQuarter: State!
    internal private(set) var sold: State!
    internal private(set) var soldOut: State!
    internal private(set) var winner: State!
    
    internal private(set) var state: State!
    internal private(set) var count: Int
    
    public init(_ numberGumballs: Int) {
        self.count = numberGumballs
        
        hasQuarter = HasQuarter(self)
        noQuarter = NoQuarter(self)
        sold = Sold(self)
        soldOut = SoldOut(self)
        winner = Winner(self)
        
        state = (numberGumballs > 0) ? noQuarter : soldOut
    }
    
    // Code smell: If this class needs to conform to State, should it derive from State so its methods are required to match? Exception: we call dispense() directly from turnCrank().
    public func insertQuarter() {
        state.insertQuarter()
    }
    
    public func ejectQuarter() {
        state.ejectQuarter()
    }
    
    public func turnCrank() {
        state.turnCrank()
        state.dispense()
    }
    
    // Code smell: setter using another data member as argument screams for abstraction.
    internal func setState(_ state: State) {
        self.state = state
    }
    
    internal func releaseBall() {
        print("A gumball comes rolling out the slot...")
        if count != 0 {
            count -= 1
        }
    }
    
}

extension GumballMachine: CustomStringConvertible {
    public var description: String {
        let company = "Mighty Gumball Inc."
        let model = "Swift-enabled Standing Gumball Model #2018"
        let inventory = "Inventory: \(count) gumball" + ((count != 1) ? "s" : "")
        let status = "Machine is \(state!)"
        return "\n\(company)\n\(model)\n\(inventory)\n\(status)\n"
    }
}
