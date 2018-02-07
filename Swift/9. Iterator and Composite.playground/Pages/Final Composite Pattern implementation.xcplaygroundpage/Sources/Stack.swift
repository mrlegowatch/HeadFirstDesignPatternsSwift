// Helper class to emulate Java.

public struct Stack<Element> {
    private var array: [Element] = []
    
    public init() { }
    
    mutating public func push(_ element: Element) {
        array.append(element)
    }
    
    mutating public func pop() -> Element? {
        return array.popLast()
    }
    
    public func peek() -> Element? {
        return array.last
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
}
