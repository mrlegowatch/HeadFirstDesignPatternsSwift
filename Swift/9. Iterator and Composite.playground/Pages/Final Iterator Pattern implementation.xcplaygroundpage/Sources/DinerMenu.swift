//
//  DinerMenu.swift
//  Iterator Pattern
//
//  Based on "Head First Design Patterns," Freeman & Robson, O'Reilly.
//
//  Created by Brian Arnold on 2/6/18.
//  Copyright © 2018 Brian Arnold. All rights reserved.
//

public class DinerMenu {
    private let maxItemCount = 6
    private var itemCount = 0
    private var menuItems: [MenuItem?]
    
    public init() {
        menuItems = [MenuItem?](repeating: nil, count: maxItemCount)
        
        addItem(name: "Vegetarian BLT", description: "(Fakin') Bacon with lettuce & tomato on whole wheat", isVegetarian: true, price: 2.99)
        addItem(name: "BLT", description: "Bacon with lettuce & tomato on whole wheat", isVegetarian: false, price: 2.99)
        addItem(name: "Soup of the day", description: "Soup of the day, with a side of potato salad", isVegetarian: false, price: 3.29)
        addItem(name: "Hotdog", description: "A hot dog, with sauerkraut, relish, onions, topped with cheese", isVegetarian: true, price: 3.05)
        addItem(name: "Steamed Veggies and Brown Rice", description: "Steamed vegetables over brown rice", isVegetarian: true, price: 3.99)
        addItem(name: "Pasta", description: "Spaghetti with Marinara Sauce, and a slice of sourdough bread", isVegetarian: true, price: 3.89)
    }
    
    public func addItem(name: String, description: String, isVegetarian: Bool, price: Double) {
        let menuItem = MenuItem(name: name, description: description, isVegetarian: isVegetarian, price: price)
        if itemCount >= maxItemCount {
            print("Sorry, menu is full! Can't add item to menu!")
        } else {
            menuItems[itemCount] = menuItem
            itemCount += 1
        }
    }
}

extension DinerMenu: Menu {
    
    public func makeIterator() -> AnyIterator<MenuItem> {
        return AnyIterator(DinerMenuIterator(menuItems))
    }
}
