//
//  CompositeIterator.swift
//  Composite Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 2/6/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class CompositeIterator: IteratorProtocol {
    
    public typealias Element = MenuComponent
    
    private var stack = Stack<AnyIterator<MenuComponent>>()
    
    public init(_ iterator: AnyIterator<MenuComponent>) {
        stack.push(iterator)
    }
    
    public func next() -> CompositeIterator.Element? {
        guard !stack.isEmpty else { return nil }
        
        let iterator = stack.peek()
        if let component = iterator?.next() {
            stack.push(component.makeIterator())
            return component
        } else {
            _ = stack.pop()
            return next()
        }
    }
}
