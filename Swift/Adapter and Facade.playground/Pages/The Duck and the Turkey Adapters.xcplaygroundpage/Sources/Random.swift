import Foundation

public struct Random {
    
    public init() { }
    
    public func nextInt(_ upperBound: Int) -> Int {
        return Int(arc4random_uniform(UInt32(upperBound)))
    }
}
