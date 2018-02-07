//: [Previous](@previous)
//: ## Is the Waitress ready for prime time?

class MenuItem {
    let name: String
    let description: String
    let isVegetarian: Bool
    let price: Double
    
    init(name: String, description: String, isVegetarian: Bool, price: Double) {
        self.name = name
        self.description = description
        self.isVegetarian = isVegetarian
        self.price = price
    }
}

class PancakeHouseMenu {
    private var menuItems = [MenuItem]()
    
    init() {
        addItem(name: "K&B's Pancake Breakfast", description: "Pancakes with scrambled eggs, and toast", isVegetarian: true, price: 2.99)
        addItem(name: "Regular Pancake Breakfast", description: "Pancakes with fried eggs, sausage", isVegetarian: false, price: 2.99)
        addItem(name: "Blueberry Pancakes", description: "Pancakes made with fresh blueberries", isVegetarian: true, price: 3.49)
        addItem(name: "Waffles", description: "Waffles, your choice of blueberries or strawberries", isVegetarian: true, price: 3.59)
    }
    
    
    func addItem(name: String, description: String, isVegetarian: Bool, price: Double) {
        let menuItem = MenuItem(name: name, description: description, isVegetarian: isVegetarian, price: price)
        menuItems.append(menuItem)
    }
}

class DinerMenu {
    private let maxItemCount = 6
    private var itemCount = 0
    private var menuItems: [MenuItem?]
    
    init() {
        menuItems = [MenuItem?](repeating: nil, count: maxItemCount)
        
        addItem(name: "Vegetarian BLT", description: "(Fakin') Bacon with lettuce & tomato on whole wheat", isVegetarian: true, price: 2.99)
        addItem(name: "BLT", description: "Bacon with lettuce & tomato on whole wheat", isVegetarian: false, price: 2.99)
        addItem(name: "Soup of the day", description: "Soup of the day, with a side of potato salad", isVegetarian: false, price: 3.29)
        addItem(name: "Hotdog", description: "A hot dog, with sauerkraut, relish, onions, topped with cheese", isVegetarian: true, price: 3.05)
    }
    
    func addItem(name: String, description: String, isVegetarian: Bool, price: Double) {
        let menuItem = MenuItem(name: name, description: description, isVegetarian: isVegetarian, price: price)
        if itemCount >= maxItemCount {
            print("Sorry, menu is full! Can't add item to menu!")
        } else {
            menuItems[itemCount] = menuItem
            itemCount += 1
        }
    }
}

protocol Menu /*: Sequence where Element: MenuItem */ {
    
    func makeIterator() -> AnyIterator<MenuItem>
    
}

extension PancakeHouseMenu: Menu {
    
    public func makeIterator() -> AnyIterator<MenuItem> {
        return AnyIterator(menuItems.makeIterator())
    }
}

class DinerMenuIterator: IteratorProtocol {
    
    typealias Element = MenuItem
    
    let items: [MenuItem?]
    var position = 0
    
    init(_ items: [MenuItem?]) {
        self.items = items
    }
    
    func next() -> DinerMenuIterator.Element? {
        defer { position += 1 }
        guard position < items.count && items[position] != nil else { return nil }
        return items[position]
    }
    
}

extension DinerMenu: Menu {
    
    public func makeIterator() -> AnyIterator<MenuItem> {
        return AnyIterator(DinerMenuIterator(menuItems))
    }
}

class CaféMenu {
    var menuItems = [String:MenuItem]()
    
    init() {
        addItem(name: "Veggie Burger and Air Fries", description: "Veggie burger on a whole wheat bun, lettuce, tomato, and fries", isVegetarian: true, price: 3.99)
        addItem(name: "Soup of the day", description: "A cup of the soup of the day, with a side salad", isVegetarian: false, price: 3.69)
        addItem(name: "Burrito", description: "A large burrito, with whole pinto beans, salsa, guacamole", isVegetarian: true, price: 4.29)
    }
    
    func addItem(name: String, description: String, isVegetarian: Bool, price: Double) {
        let menuItem = MenuItem(name: name, description: description, isVegetarian: isVegetarian, price: price)
        menuItems[menuItem.name] = menuItem
    }
}

extension CaféMenu: Menu {
    
    public func makeIterator() -> AnyIterator<MenuItem> {
        return AnyIterator(menuItems.values.makeIterator())
    }
}

//: Iterate through each Menu. The code is going to be simple and it will handle any number of menus.

class Waitress {
    let menus: [Menu]
    
    // Now we just take an Array of Menus.
    init(_ menus: [Menu]) {
        self.menus = menus
    }
    
    // And we iterate through the menus, passing each menu to the overloaded printMenu() method.
    func printMenu() {
        for menu in menus {
            printMenu(menu.makeIterator())
        }
    }
    
    // No code changes here.
    func printMenu(_ menu: AnyIterator<MenuItem>) {
        for menuItem in menu {
            print("\(menuItem.name), \(menuItem.price) -- \(menuItem.description)")
        }
    }
}

do {
    let pancakeHouseMenu = PancakeHouseMenu()
    let dinerMenu = DinerMenu()
    let caféMenu = CaféMenu()
    
    let waitress = Waitress([pancakeHouseMenu, dinerMenu, caféMenu])
    
    waitress.printMenu()
}

//: [Next](@next)
