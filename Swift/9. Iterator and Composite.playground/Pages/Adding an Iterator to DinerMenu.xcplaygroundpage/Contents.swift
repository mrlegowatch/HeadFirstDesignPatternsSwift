//: [Previous](@previous)
//: ## Adding an Iterator to DinerMenu

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

protocol Iterator {
    // The hasNext() method returns a boolean indicating whether or not there are more elements to iterate over...
    func hasNext() -> Bool
    func next() -> AnyObject
}

// We implement the Iterator interface
class DinerMenuIterator: Iterator {
    let items: [MenuItem?]
    
    // Position maintains the current position of the iteration over the array.
    var position = 0

    init(_ items: [MenuItem?]) {
        self.items = items
    }
    
    func next() -> AnyObject {
        // The next() method returns the next item in the array and increments the position.
        // IN SWIFT: use a defer statement.
        defer { position += 1 }
        return items[position]!
    }
    
    func hasNext() -> Bool {
        // The hasNext() method checks to see if we've seen all the elements of the array and returns true if there are more to iterate through.
        // Because the diner check went ahead and allocated a max sized array, we need to check not only if we are at the end of the array, but also if the next item is nil, which indicates there are no more items.
        // IN SWIFT: use a guard statement.
        guard position < items.count && items[position] != nil else { return false }
        return true
    }
}

//: Reworking the Diner menu with Iterator

extension DinerMenu {
    
    // Here's the createIterator() method. It creates a DinerMenuIterator from the menuItems array and returns it to the client.
    // We're treturning the Iterator interface. The client doesn't need to know how the menuItems are maintained in the DinerMenu, nor does it need to know how the DinerMenuIterator is implemented. It jsut needs to use the iterators to step through the items in the menu.
    // IN SWIFT: follow Swift coding style guidelines, "make" instad of "create".
    func makeIterator() -> Iterator {
        return DinerMenuIterator(menuItems)
    }
}

//: Exercise: Go ahead and implement the PancakeHouseIterator yourself and make the changes needed to incorporate it into the PancakeHouseMenu.

class PancakeHouseIterator: Iterator {
    let items: [MenuItem]
    var position = 0
    
    init(_ items: [MenuItem]) {
        self.items = items
    }
    
    func next() -> AnyObject {
        defer { position += 1 }
        return items[position]
    }
    
    func hasNext() -> Bool {
        return position < items.count
    }
}

extension PancakeHouseMenu {
    
    func makeIterator() -> Iterator {
        return PancakeHouseIterator(menuItems)
    }
}

//: Fixing up the Waitress code

class Waitress {
    let pancakeHouseMenu: PancakeHouseMenu
    let dinerMenu: DinerMenu
    
    // In the constructor the Waitress takes care of the two menus.
    init(pancakeHouseMenu: PancakeHouseMenu, dinerMenu: DinerMenu) {
        self.pancakeHouseMenu = pancakeHouseMenu
        self.dinerMenu = dinerMenu
    }
    
    func printMenu() {
        // The printMenu() method now creates two iterators, one for each menu.
        let pancakeIterator = pancakeHouseMenu.makeIterator()
        let dinerIterator = dinerMenu.makeIterator()
        
        // And then calls the overloaded printMenu() method with each iterator.
        print("MENU\n----\nBREAKFAST")
        printMenu(pancakeIterator)
        print("\nLUNCH")
        printMenu(dinerIterator)
    }
    
    // The overloaded printMenu() method uses the Iterator to step through the menu items and print them.
    func printMenu(_ iterator: Iterator) {
        // Test if there are any more items.
        while iterator.hasNext() {
            // Get the next item.
            // IN SWIFT: dynamically cast as the sub-type we require.
            let menuItem = iterator.next() as! MenuItem
            // Use the item to get name, price, and description and print them.
            print("\(menuItem.name), \(menuItem.price) -- \(menuItem.description)")
        }
        
        // Note that we're down to one loop.
    }
}

//: Testing our code

// First we create the new menus.
let pancakeHouseMenu = PancakeHouseMenu()
let dinerMenu = DinerMenu()

// Then we create a Waitress and pass the menus.
let waitress = Waitress(pancakeHouseMenu: pancakeHouseMenu, dinerMenu: dinerMenu)

// Then we print them.
waitress.printMenu()

//: [Next](@next)
