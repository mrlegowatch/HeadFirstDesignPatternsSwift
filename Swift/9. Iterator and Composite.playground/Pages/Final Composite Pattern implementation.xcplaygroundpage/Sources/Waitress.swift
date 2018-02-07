//
//  Waitress.swift
//  Composite Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 2/6/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class Waitress {
    private var allMenus: MenuComponent
    
    public init(_ allMenus: MenuComponent) {
        self.allMenus = allMenus
    }
    
    public func printMenu() {
        allMenus.print()
    }
    
    public func printVegetarianMenu() {
        let iterator = allMenus.makeIterator()
        print("\nVEGETARIAN MENU\n------")
        for menuComponent in iterator {
            do {
                if try menuComponent.isVegetarian() {
                    menuComponent.print()
                }
            }
            catch {
                // ignore
            }
        }
    }
}
