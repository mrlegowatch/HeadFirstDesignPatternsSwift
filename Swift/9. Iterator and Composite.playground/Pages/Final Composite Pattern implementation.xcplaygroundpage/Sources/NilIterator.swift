//
//  NilIterator.swift
//  Composite Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 2/6/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class NilIterator: IteratorProtocol {
    
    public typealias Element = MenuComponent
    
    public func next() -> NilIterator.Element? {
        return nil
    }
}
