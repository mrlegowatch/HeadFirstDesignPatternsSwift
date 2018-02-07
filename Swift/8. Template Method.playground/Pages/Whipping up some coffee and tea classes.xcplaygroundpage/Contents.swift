//: # Chapter 8: The Template Method Pattern
//:
//: Comments are from the Head First Design Patterns book.
//:
//: Where Swift deviates from the book, the annotation "IN SWIFT" is used in the comment.
//:
//: ## Whipping up some coffee and tea classes

// Here's our Coffee class for making cofee
class Coffee {
    
    // Here's our recipe for coffee, straight from the training manual.
    func prepareRecipe() {
        // Each of the steps is implemented as a separate method.
        boilWater()
        brewCoffeeGrinds()
        pourInCup()
        addSugarAndMilk()
    }
    
    // Each of these methods implements one step of the algorithm. Three's a method to boil water, brew the coffee, pur the coffee in a cup, and add sugar and milk.
    
    func boilWater() {
        print("Boiling water")
    }
    
    func brewCoffeeGrinds() {
        print("Dripping coffee through filter")
    }
    
    func pourInCup() {
        print("Pouring into cup")
    }
    
    func addSugarAndMilk() {
        print("Adding Sugar and Milk")
    }
    
}

class Tea {
    
    func prepareRecipe() {
        // This looks very similar to the one we just implemented in Coffee; the second and fourth steps are different, but it's basically the same recipe.
        boilWater()
        steepTeaBag()
        pourInCup()
        addLemon()
    }
    
    // Notice that these two methods are exactly the same as they are in Coffee! So we definitely have some code duplication going on here.
    
    func boilWater() {
        print("Boiling water")
    }
    
    func pourInCup() {
        print("Pouring into cup")
    }
    
    // These two methods are specialized to tea.
    
    func steepTeaBag() {
        print("Steeping the tea")
    }
    
    func addLemon() {
        print("Adding Lemon")
    }
    
}

//: [Next](@next)
