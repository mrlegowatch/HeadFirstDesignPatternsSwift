//: [Previous](@previous)
//: ## Cleaning things up with Swift.Iterator

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

//: We are almost there...

// This is a simple interface that just lets clients get an iterator for the items in the menu.
protocol Menu /*: Sequence where Element: MenuItem */ {
    
    func makeIterator() -> AnyIterator<MenuItem>
    
}

// IN SWIFT: We need to specify protocol conformance to Menu.
extension PancakeHouseMenu: Menu {
    
    // Instead of creating our own iterator now, we just call the makeIterator() method on the menuItems Array.
    public func makeIterator() -> AnyIterator<MenuItem> {
        return AnyIterator(menuItems.makeIterator())
    }
}

// IN SWIFT: Define an iterator for the DinerMenu that conforms to IteratorProtocol. We need to clarify the type association for Element, and implement a next() function.
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

// IN SWIFT: as with BreakfastMenu, DinerMenu also needs to conform to Menu, and return our custom iterator.
extension DinerMenu: Menu {
    
    public func makeIterator() -> AnyIterator<MenuItem> {
        return AnyIterator(DinerMenuIterator(menuItems))
    }
}

class Waitress {
    let pancakeHouseMenu: Menu
    let dinerMenu: Menu
    
    init(pancakeHouseMenu: Menu, dinerMenu: Menu) {
        self.pancakeHouseMenu = pancakeHouseMenu
        self.dinerMenu = dinerMenu
    }
    
    // IN SWIFT: we generally use for loops to iterate, and don't call makeIterator() directly, so here we instead pass each menu as a type-conforming Sequence (see printMenu() below).
    func printMenu() {
        let pancakeIterator = pancakeHouseMenu.makeIterator()
        let dinerIterator = dinerMenu.makeIterator()
        print("MENU\n----\nBREAKFAST")
        printMenu(pancakeIterator)
        print("\nLUNCH")
        printMenu(dinerIterator)
    }
    
    func printMenu(_ menu: AnyIterator<MenuItem>) {
        for menuItem in menu {
            print("\(menuItem.name), \(menuItem.price) -- \(menuItem.description)")
        }
    }
}

do {
    // First we create the new menus.
    let pancakeHouseMenu = PancakeHouseMenu()
    let dinerMenu = DinerMenu()
    
    // Then we create a Waitress and pass the menus.
    let waitress = Waitress(pancakeHouseMenu: pancakeHouseMenu, dinerMenu: dinerMenu)
    
    // Then we print them.
    waitress.printMenu()
}


//: [Next](@next)
