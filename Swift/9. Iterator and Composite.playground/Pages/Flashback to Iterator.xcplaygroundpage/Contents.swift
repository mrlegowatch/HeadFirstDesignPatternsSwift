//: [Previous](@previous)
//: ## Flashback to Iterator


enum MenuError: Error {
    case unsupportedOperation
}

protocol MenuComponent {
    
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
    
    func add(_ menuComponent: MenuComponent) throws {
        throw MenuError.unsupportedOperation
    }
    
    func remove(_ menuComponent: MenuComponent) throws {
        throw MenuError.unsupportedOperation
    }
    
    func child(at index: Int) throws -> MenuComponent {
        throw MenuError.unsupportedOperation
    }
    
    func price() throws -> Double {
        throw MenuError.unsupportedOperation
    }
    
    func isVegetarian() throws -> Bool {
        throw MenuError.unsupportedOperation
    }
}

class CompositeIterator: IteratorProtocol {
    
    typealias Element = MenuComponent
    
    var stack = Stack<AnyIterator<MenuComponent>>()
    
    init(_ iterator: AnyIterator<MenuComponent>) {
        stack.push(iterator)
    }
    
    func next() -> CompositeIterator.Element? {
        guard !stack.isEmpty else { return nil }
        
        let iterator = stack.peek()
        if let component = iterator?.next() {
            stack.push(component.makeIterator())
            return component
        } else {
            stack.pop()
            return next()
        }
    }
}

class NullIterator: IteratorProtocol {
    
    typealias Element = MenuComponent
    
    func next() -> NullIterator.Element? {
        return nil
    }
}

class MenuItem: MenuComponent {
    let name: String
    let description: String
    let isVegetarianValue: Bool
    let priceValue: Double
    
    init(name: String, description: String, isVegetarian: Bool, price: Double) {
        self.name = name
        self.description = description
        self.isVegetarianValue = isVegetarian
        self.priceValue = price
    }
    
    func price() throws -> Double {
        return priceValue
    }
    
    func isVegetarian() throws -> Bool {
        return isVegetarianValue
    }
    
    // IN SWIFT: It's best not to name a function the same as a system function, but we did, and adding "Swift." is how you work around that.
    func print() {
        let vegetarian = isVegetarianValue ? "(v)" : ""
        Swift.print("  \(name) \(vegetarian), \(price)    -- \(description)")
    }
    
    func makeIterator() -> AnyIterator<MenuComponent> {
        return AnyIterator(NullIterator())
    }
}

class Menu: MenuComponent {
    var name: String
    var description: String
    var menuComponents = [MenuComponent]()
    var iterator: AnyIterator<MenuComponent>?
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
    }
    
    func add(_ menuComponent: MenuComponent) throws {
        menuComponents.append(menuComponent)
    }
    
    func remove(_ menuComponent: MenuComponent) throws {
        if let index = menuComponents.index(where: { $0.name == menuComponent.name }) {
            menuComponents.remove(at: index)
        }
    }
    
    func child(at index: Int) throws -> MenuComponent {
        return menuComponents[index]
    }
    
    func print() {
        Swift.print("\n\(name), \(description)\n------------------------")
        
        for menuComponent in menuComponents {
            menuComponent.print()
        }
    }
    
    func makeIterator() -> AnyIterator<MenuComponent> {
        if iterator == nil {
            iterator = AnyIterator(CompositeIterator(AnyIterator(menuComponents.makeIterator())))
        }
        return iterator!
    }
}

//: Getting ready for the test drive...

class Waitress {
    var allMenus: MenuComponent
    
    init(_ allMenus: MenuComponent) {
        self.allMenus = allMenus
    }
    
    func printMenu() {
        allMenus.print()
    }
    
    func printVegetarianMenu() {
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

//: Now for the test drive...

let pancakeHouseMenu = Menu(name: "PANCAKE HOUSE MENU", description: "Breakfast")
let dinerMenu = Menu(name: "DINER MENU", description: "Lunch")
let caféMenu = Menu(name: "CAFÉ MENU", description: "Dinner")
let dessertMenu = Menu(name: "DESSERT MENU", description: "Dessert of course!")

let allMenus = Menu(name: "ALL MENUS", description: "All menus combined")
try! allMenus.add(pancakeHouseMenu)
try! allMenus.add(dinerMenu)
try! allMenus.add(caféMenu)

try! dinerMenu.add(MenuItem(name: "Pasta", description: "Spaghetti with Marinara Sauce, and a slice of sourdough bread", isVegetarian: true, price: 3.89))
try! dinerMenu.add(dessertMenu)
try! dessertMenu.add(MenuItem(name: "Apple Pie", description: "Apple pie with a flakey crust, topped with vanilla ice cream", isVegetarian: true, price: 1.59))
let waitress = Waitress(allMenus)
waitress.printVegetarianMenu()


//: [Next](@next)
