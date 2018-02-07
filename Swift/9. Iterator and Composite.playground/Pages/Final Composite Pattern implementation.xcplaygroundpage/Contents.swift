//: [Previous](@previous)
//: ## The Final Composite Pattern implementation
//:
//: The final Iterator implementation places the relevant code in source files, and the playground takes the role of just running the test.
//:

let pancakeHouseMenu = Menu(name: "PANCAKE HOUSE MENU", description: "Breakfast")
let dinerMenu = Menu(name: "DINER MENU", description: "Lunch")
let caféMenu = Menu(name: "CAFÉ MENU", description: "Dinner")
let dessertMenu = Menu(name: "DESSERT MENU", description: "Dessert of course!")

let allMenus = Menu(name: "ALL MENUS", description: "All menus combined")
try! allMenus.add(pancakeHouseMenu)
try! allMenus.add(dinerMenu)
try! allMenus.add(caféMenu)

try! pancakeHouseMenu.add(MenuItem(
    name: "K&B's Pancake Breakfast",
    description: "Pancakes with scrambled eggs, and toast",
    isVegetarian: true,
    price: 2.99))
try! pancakeHouseMenu.add(MenuItem(
    name: "Regular Pancake Breakfast",
    description: "Pancakes with fried eggs, sausage",
    isVegetarian: false,
    price: 2.99))
try! pancakeHouseMenu.add(MenuItem(
    name: "Blueberry Pancakes",
    description: "Pancakes made with fresh blueberries, and blueberry syrup",
    isVegetarian: true,
    price: 3.49))
try! pancakeHouseMenu.add(MenuItem(
    name: "Waffles",
    description: "Waffles, with your choice of blueberries or strawberries",
    isVegetarian: true,
    price: 3.59))

try! dinerMenu.add(MenuItem(
    name: "Vegetarian BLT",
    description: "(Fakin') Bacon with lettuce & tomato on whole wheat",
    isVegetarian: true,
    price: 2.99))
try! dinerMenu.add(MenuItem(
    name: "BLT",
    description: "Bacon with lettuce & tomato on whole wheat",
    isVegetarian: false,
    price: 2.99))
try! dinerMenu.add(MenuItem(
    name: "Soup of the day",
    description: "A bowl of the soup of the day, with a side of potato salad",
    isVegetarian: false,
    price: 3.29))
try! dinerMenu.add(MenuItem(
    name: "Hotdog",
    description: "A hot dog, with saurkraut, relish, onions, topped with cheese",
    isVegetarian: false,
    price: 3.05))
try! dinerMenu.add(MenuItem(
    name: "Steamed Veggies and Brown Rice",
    description: "A medly of steamed vegetables over brown rice",
    isVegetarian: true,
    price: 3.99))

try! dinerMenu.add(MenuItem(
    name: "Pasta",
    description: "Spaghetti with Marinara Sauce, and a slice of sourdough bread",
    isVegetarian: true,
    price: 3.89))

try! dinerMenu.add(dessertMenu)

try! dessertMenu.add(MenuItem(
    name: "Apple Pie",
    description: "Apple pie with a flakey crust, topped with vanilla icecream",
    isVegetarian: true,
    price: 1.59))
try! dessertMenu.add(MenuItem(
    name: "Cheesecake",
    description: "Creamy New York cheesecake, with a chocolate graham crust",
    isVegetarian: true,
    price: 1.99))
try! dessertMenu.add(MenuItem(
    name: "Sorbet",
    description: "A scoop of raspberry and a scoop of lime",
    isVegetarian: true,
    price: 1.89))

try! caféMenu.add(MenuItem(
    name: "Veggie Burger and Air Fries",
    description: "Veggie burger on a whole wheat bun, lettuce, tomato, and fries",
    isVegetarian: true,
    price: 3.99))
try! caféMenu.add(MenuItem(
    name: "Soup of the day",
    description: "A cup of the soup of the day, with a side salad",
    isVegetarian: false,
    price: 3.69))
try! caféMenu.add(MenuItem(
    name: "Burrito",
    description: "A large burrito, with whole pinto beans, salsa, guacamole",
    isVegetarian: true,
    price: 4.29))
let waitress = Waitress(allMenus)
waitress.printVegetarianMenu()

//: [Next](@next)
