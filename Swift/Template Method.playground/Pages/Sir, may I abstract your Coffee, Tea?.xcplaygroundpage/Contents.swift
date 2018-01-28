//: [Previous](@previous)
//: ## Sir, may I abstract your Coffee, Tea?

protocol CaffeineBeverage {
    
    // The prepareRecipe() method differs in each subclass, so it is defined as abstract.
    func prepareRecipe()
    
    func boilWater()
    
    func pourInCup()
}

// The boilWater() and pourInCup() methods are shared by both subclasses so they are defined in the superclass.
extension CaffeineBeverage {
    
    func boilWater() {
        print("Boiling water")
    }
    
    func pourInCup() {
        print("Pouring into cup")
    }
}

class Coffee: CaffeineBeverage {
    
    // Each subclass implements its own recipe.
    func prepareRecipe() {
        boilWater()
        brewCoffeeGrinds()
        pourInCup()
        addSugarAndMilk()
    }
    
    // The methods specific to Coffee stay in the subclass.
    
    func brewCoffeeGrinds() {
        print("Dripping coffee through filter")
    }
    
    func addSugarAndMilk() {
        print("Adding Sugar and Milk")
    }
}

class Tea: CaffeineBeverage {
    
    // Each subclass overrides the prepareRecipe() method and implements its own recipe.
    func prepareRecipe() {
        boilWater()
        steepTeaBag()
        pourInCup()
        addLemon()
    }
    
    // The methods specific to Tea stay in the subclass.
    
    func steepTeaBag() {
        print("Steeping the tea")
    }
    
    func addLemon() {
        print("Adding Lemon")
    }
}

//: [Next](@next)
