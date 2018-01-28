//: [Previous](@previous)
//: ## Sorting with Template Method

class Duck {
    let name: String
    let weight: Int
    
    init(_ name: String, _ weight: Int) {
        self.name = name
        self.weight = weight
    }
}

extension Duck: CustomStringConvertible {
    
    var description: String {
        return "\(name) weighs \(weight)"
    }
    
}

// Swift array sort() (or in this case, sorted(), which returns a copy of the array) requires that the elements conform to Comparable protocol, which in turn requires Equatable protocol.

extension Duck: Equatable {
    static func==(lhs: Duck, rhs: Duck) -> Bool {
        return lhs.weight == rhs.weight
    }
}

extension Duck: Comparable {
    
    static func<(lhs: Duck, rhs: Duck) -> Bool {
        return lhs.weight < rhs.weight
    }
    
}

let ducks: [Duck] = [
    Duck("Daffy", 8),
    Duck("Dewey", 2),
    Duck("Howard", 7),
    Duck("Louie", 2),
    Duck("Donald", 10),
    Duck("Huey", 2)]

print("Before sorting:")
print(ducks)

let sorted = ducks.sorted()
print("After sorting:")
print(sorted)

//: [Next](@next)
