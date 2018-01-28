//: [Previous](@previous)
//: # Dealing with multithreading
//:
//: In Swift, a var or let instance is initialized atomically, so singleton creation is thread-safe.
//: If, however, we weren't implementing it in exactly that manner, we might need to implement
//: thread synchronization to prevent multiple threads from initializing the instance at the same time.
//:
//: As of Swift 4, there are no synchronization primitives in the language, outside of var and let initialization.
//: In the meantime, one can cheat by leveraging the Objective-C runtime synchronization functions, as shown below.

import Foundation // For objc_sync_enter, objc_sync_exit, and Thread

// IN SWIFT: for Swift 4 and earlier, use a closure that is wrapped in Objective-C synchronization primitives.
internal func synchronized<T>(_ lock: AnyObject, closure: () throws -> T) rethrows -> T {
    objc_sync_enter(lock)
    defer { objc_sync_exit(lock) }
    return try closure()
}

//: ## Use "double-checked locking" to reduce the use of synchronization in getInstance().

public class ChocolateBoiler {
    private var isEmpty: Bool
    private var isBoiled: Bool
    
    // IN SWIFT: we wouldn't really do this, we're doing it for illustration.
    private static var instance: ChocolateBoiler! = nil
    
    // Check for an instance and if there isn't one, enter a synchronized block.
    // IN SWIFT: if we needed thread synchronization within a function, we might use a synchronized(_:) closure:
    public static func getInstance() -> ChocolateBoiler {
        if instance == nil {
            // Note we only synchronize the first time through.
            synchronized(self) {
                // Once in the block, check again and if still nil, create an instance.
                if instance == nil {
                    instance = ChocolateBoiler()
                }
            }
        }
        return instance
    }
    
    // IN SWIFT: make the instance count observable for this example.
    static var instanceCount = 0
    
    private init() {
        print("Creating unique instance of Chocolate Boiler")

        // This code only started when the boiler is empty!
        isEmpty = false
        isBoiled = false
        
        ChocolateBoiler.instanceCount += 1
    }
    
    public func fill() {
        // To fill the boiler, it must be empty, and once it's full, we set the empty and boiled flags.
        if isEmpty {
            isEmpty = false
            isBoiled = false
            // fill the boiler with a milk/chocolate mixture
        }
    }
    
    public func drain() {
        // To drain the boiler, it must be full (non-empty) and also boiled. Once it is drained we set empty back to true.
        if !isEmpty && isBoiled {
            // drain the boiled milk and chocolate
            isEmpty = true
        }
    }
    
    public func boil() {
        // To boil the mixture, the boiler has to be full and not already boiled. Once it's boiled we set the boiled flag to true.
        if !isEmpty && !isBoiled {
            // bring the contents to a boil
            isBoiled = true
        }
    }
}

// Spin up a thread that accesses the instance via a function
do {
    let thread1 = Thread(block: {
        ChocolateBoiler.getInstance().fill()
        ChocolateBoiler.getInstance().boil()
        ChocolateBoiler.getInstance().drain()
        
        print("ChocolateBoiler thread1 instance count = \(ChocolateBoiler.instanceCount)")
    })
    thread1.start()
}

do {
    let thread2 = Thread(block: {
        ChocolateBoiler.getInstance().fill()
        ChocolateBoiler.getInstance().boil()
        ChocolateBoiler.getInstance().drain()
        print("ChocolateBoiler thread2 instance count = \(ChocolateBoiler.instanceCount)")
    })
    thread2.start()
}

// IN SWIFT: You may notice that sometimes thread2 beats thread1 in producing output on repeat runs.
print("ChocolateBoiler playground thread instance count = \(ChocolateBoiler.instanceCount)")

//: [Next](@next)
