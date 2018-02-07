//
//  Menu.swift
//  Iterator Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 2/6/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public protocol Menu /*: Sequence where Element: MenuItem */ {
    
    func makeIterator() -> AnyIterator<MenuItem>
    
}
