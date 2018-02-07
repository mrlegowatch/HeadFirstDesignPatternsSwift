//
//  DinerMenuIterator.swift
//  Iterator Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 2/6/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class DinerMenuIterator: IteratorProtocol {
    
    public typealias Element = MenuItem
    
    private let items: [MenuItem?]
    private var position = 0
    
    internal init(_ items: [MenuItem?]) {
        self.items = items
    }
    
    public func next() -> DinerMenuIterator.Element? {
        defer { position += 1 }
        guard position < items.count && items[position] != nil else { return nil }
        return items[position]
    }
    
}
