//
//  Waitress.swift
//  Iterator Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 2/6/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class Waitress {
    private let menus: [Menu]
    
    // Now we just take an Array of Menus.
    public init(_ menus: [Menu]) {
        self.menus = menus
    }
    
    // And we iterate through the menus, passing each menu to the overloaded printMenu() method.
    public func printMenu() {
        for menu in menus {
            printMenu(menu.makeIterator())
        }
    }
    
    // No code changes here.
    public func printMenu(_ menu: AnyIterator<MenuItem>) {
        print()
        for menuItem in menu {
            print("\(menuItem.name), \(menuItem.price) -- \(menuItem.description)")
        }
    }
}
