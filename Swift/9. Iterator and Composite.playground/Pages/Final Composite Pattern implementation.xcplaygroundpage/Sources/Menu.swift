//
//  Menu.swift
//  Composite Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 2/6/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class Menu: MenuComponent {
    public var name: String
    public var description: String
    private var menuComponents = [MenuComponent]()
    var iterator: AnyIterator<MenuComponent>?

    public init(name: String, description: String) {
        self.name = name
        self.description = description
    }
    
    public func add(_ menuComponent: MenuComponent) throws {
        menuComponents.append(menuComponent)
    }
    
    public func remove(_ menuComponent: MenuComponent) throws {
        if let index = menuComponents.index(where: { $0.name == menuComponent.name }) {
            menuComponents.remove(at: index)
        }
    }
    
    public func child(at index: Int) throws -> MenuComponent {
        return menuComponents[index]
    }
    
    public func print() {
        Swift.print("\n\(name), \(description)\n------------------------")
        
        for menuComponent in menuComponents {
            menuComponent.print()
        }
    }
    
    public func makeIterator() -> AnyIterator<MenuComponent> {
        if iterator == nil {
            iterator = AnyIterator(CompositeIterator(AnyIterator(menuComponents.makeIterator())))
        }
        return iterator!
    }
}
