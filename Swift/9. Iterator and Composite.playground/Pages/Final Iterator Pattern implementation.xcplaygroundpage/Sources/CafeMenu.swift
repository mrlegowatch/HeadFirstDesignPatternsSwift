//
//  CaféMenu.swift
//  Iterator Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 2/6/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class CaféMenu {
    private var menuItems = [String:MenuItem]()
    
    public init() {
        addItem(name: "Veggie Burger and Air Fries", description: "Veggie burger on a whole wheat bun, lettuce, tomato, and fries", isVegetarian: true, price: 3.99)
        addItem(name: "Soup of the day", description: "A cup of the soup of the day, with a side salad", isVegetarian: false, price: 3.69)
        addItem(name: "Burrito", description: "A large burrito, with whole pinto beans, salsa, guacamole", isVegetarian: true, price: 4.29)
    }
    
    public func addItem(name: String, description: String, isVegetarian: Bool, price: Double) {
        let menuItem = MenuItem(name: name, description: description, isVegetarian: isVegetarian, price: price)
        menuItems[menuItem.name] = menuItem
    }
}

//: Reworking the Café Menu code

extension CaféMenu: Menu {
    
    // And here's where we implement the makeIterator() method. Notice that we're not getting an Iterator from the whole Map, just for the values.
    public func makeIterator() -> AnyIterator<MenuItem> {
        return AnyIterator(menuItems.values.makeIterator())
    }
}
