//: # Chapter 9: The Iterator and Composite Patterns
//:
//: Comments are from the Head First Design Patterns book.
//:
//: Where Swift deviates from the book, the annotation "IN SWIFT" is used in the comment.
//:
//: ## Breaking news: Objectville Diner and Objectville Pancake House Merge
//: Check out the Menu Items

class MenuItem {
    let name: String
    let description: String
    let isVegetarian: Bool // IN SWIFT, prefix with "is"
    let price: Double
    
    init(name: String, description: String, isVegetarian: Bool, price: Double) {
        self.name = name
        self.description = description
        self.isVegetarian = isVegetarian
        self.price = price
    }
}

//: Lou and Mel's Menu implementations

// Here's Lou's implementation of the Pancake House menu.
class PancakeHouseMenu {
    // Lou's using an Array to store his menu items
    var menuItems = [MenuItem]()
    
    init() {
        // Each menu item is added to the Array here, in the constructor.
        // Each menu item has a name, a description, whether or not it's a vegetarian item, and the price.
        addItem(name: "K&B's Pancake Breakfast", description: "Pancakes with scrambled eggs, and toast", isVegetarian: true, price: 2.99)
        addItem(name: "Regular Pancake Breakfast", description: "Pancakes with fried eggs, sausage", isVegetarian: false, price: 2.99)
        addItem(name: "Blueberry Pancakes", description: "Pancakes made with fresh blueberries", isVegetarian: true, price: 3.49)
        addItem(name: "Waffles", description: "Waffles, your choice of blueberries or strawberries", isVegetarian: true, price: 3.59)
    }
    
    
    func addItem(name: String, description: String, isVegetarian: Bool, price: Double) {
        // To add a menu item, Lou creates a new MenuItem, passing in each argument, and then adds it to the Array.
        let menuItem = MenuItem(name: name, description: description, isVegetarian: isVegetarian, price: price)
        menuItems.append(menuItem)
    }
    
    // other menu methods here
    // Lou has a bunch of other menu code that depends on the Array implementation. He doesn't want to rewrite all that code!
    
}

class DinerMenu {
    let maxItemCount = 6
    var itemCount = 0
    var menuItems: [MenuItem?] // IN SWIFT: emulate a Java hardcoded list with optionals
    
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
    
    // other menu methods here
    // Like Lou, Mel has a bunch of code that depends on the implementation of his menu being an Array. He's too busy cooking to rewrite all of this.
}

// : What's the problem with having two different menu representations?

class Waitress {
    
    func printMenu() {
        let pancakeHouseMenu = PancakeHouseMenu()
        let dinerMenu = DinerMenu()
        
        // The method looks the same, but the calls are returning different types.
        let breakfastItems = pancakeHouseMenu.menuItems
        let lunchItems = dinerMenu.menuItems

        // Now, we have to implement two different loops to step through the two implementations of the menu items...
        
        // ...one loop for the dynamic Array...
        for index in 0..<breakfastItems.count {
            let menuItem = breakfastItems[index]
            print("\(menuItem.name) \(menuItem.price) \(menuItem.description)")
        }
        
        // ...and another for the fixed-length array.
        for index in 0..<lunchItems.count {
            // IN SWIFT: use if-let to check for nil.
            if let menuItem = lunchItems[index] {
                print("\(menuItem.name) \(menuItem.price) \(menuItem.description)")
            }
        }
    }
    // etc.
}

let waitress = Waitress()
waitress.printMenu()

//: [Next](@next)

