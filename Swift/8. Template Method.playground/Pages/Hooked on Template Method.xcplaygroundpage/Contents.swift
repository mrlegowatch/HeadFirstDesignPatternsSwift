//: [Previous](@previous)
//: ## Hooked on Template Method

import Foundation

protocol CaffeineBeverageWithHook {
    
    func prepareRecipe()
    
    func brew()
    
    func addCondiments()
    
    func boilWater()
    
    func pourInCup()
    
    var customerWantsCondiments: Bool { get }
    
}

extension CaffeineBeverageWithHook {
    
    func prepareRecipe() {
        boilWater()
        brew()
        pourInCup()
        if customerWantsCondiments {
            addCondiments()
        }
    }
    
    func boilWater() {
        print("Boiling water")
    }
    
    func pourInCup() {
        print("Pouring into cup")
    }
    
    var customerWantsCondiments: Bool {
        return true
    }
}

class CoffeeWithHook: CaffeineBeverageWithHook {
    func brew() {
        print("Dripping Coffee through filter")
    }
    
    func addCondiments() {
        print("Adding Sugar and Milk")
    }
    
    // Here's where you override the hook and provide your own functionality.
    var customerWantsCondiments: Bool {
        let answer = getUserInput()
        
        // Get the user's input on the condiment decision and return true or false depending on the input.
        return answer.lowercased().hasPrefix("y")
    }
    
    func getUserInput() -> String {
        // In Swift, we don't have a convenient way for a playground to capture user keyboard input,
        // so we simulate it here, with randomness.
        
        let possibleAnswers = ["yes", "no"]
        let answer = possibleAnswers[Int(arc4random() % 2)]
        
        print("Would you like milk and sugar with your coffee (y/n)? \(answer)")
        return answer
    }
}

let coffee = CoffeeWithHook()
coffee.prepareRecipe()

print()

let anotherCoffee = CoffeeWithHook()
anotherCoffee.prepareRecipe()

print()

let aThirdCoffee = CoffeeWithHook()
aThirdCoffee.prepareRecipe()

//: [Next](@next)
