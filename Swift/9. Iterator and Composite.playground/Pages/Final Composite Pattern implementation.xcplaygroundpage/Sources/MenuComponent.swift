//
//  MenuComponent.swift
//  Composite Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 2/6/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

enum MenuError: Error {
    case unsupportedOperation
}

// IN SWIFT: I'd like to use var: property { get } but the example wants to throw. I cut down on the amount of throwing by making name, description and print required.
public protocol MenuComponent {
    
    func add(_ menuComponent: MenuComponent) throws
    
    func remove(_ menuComponent: MenuComponent) throws
    
    func child(at index: Int) throws -> MenuComponent
    
    var name: String { get }
    
    var description: String { get }
    
    func price() throws -> Double
    
    func isVegetarian() throws -> Bool
    
    func print()
    
    func makeIterator() -> AnyIterator<MenuComponent>

}

extension MenuComponent {
    
    public func add(_ menuComponent: MenuComponent) throws {
        throw MenuError.unsupportedOperation
    }
    
    public func remove(_ menuComponent: MenuComponent) throws {
        throw MenuError.unsupportedOperation
    }
    
    public func child(at index: Int) throws -> MenuComponent {
        throw MenuError.unsupportedOperation
    }
    
    public func price() throws -> Double {
        throw MenuError.unsupportedOperation
    }
    
    public func isVegetarian() throws -> Bool {
        throw MenuError.unsupportedOperation
    }
}

