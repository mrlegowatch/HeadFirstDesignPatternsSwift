//: [Previous](@previous)
//: ## Abstracting prepareRecipe()

protocol CaffeineBeverage {
    
    func prepareRecipe()
    
    func boilWater()
    
    func pourInCup()

    // The methods that need to be supplied by a subclass are declared abstract.
    
    func brew()

    func addCondiments()
}

extension CaffeineBeverage {

    // prepareRecipe() is our template method. Why? Because:
    //  (1) It is a method, after all.
    //  (2) It serves as a template for an algorithm, in this case, an algorithm for making caffeinated beverages.
    func prepareRecipe() {
        // In the template, each step of the algorithm is represented by a method.
        boilWater()
        brew()
        pourInCup()
        addCondiments()
    }
    
    // Some methods are handled by this class... and some are handled by the subclass.
    
    func boilWater() {
        print("Boiling water")
    }
    
    func pourInCup() {
        print("Pouring into cup")
    }
}

class Tea: CaffeineBeverage {
    
    func brew() {
        print("Steeping the tea")
    }
    
    func addCondiments() {
        print("Adding Lemon")
    }
}

class Coffee: CaffeineBeverage {
    
    func brew() {
        print("Dripping Coffee through filter")
    }
    
    func addCondiments() {
        print("Adding Sugar and Milk")
    }
}

//: Let's make some tea

let myTea = Tea()
myTea.prepareRecipe()

let myCoffee = Coffee()
myCoffee.prepareRecipe()

//: [Next](@next)
