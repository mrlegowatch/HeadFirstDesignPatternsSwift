//: [Previous](@previous)
//: # Design Puzzle - An action adventure game
//:
//: - (1) Identify one abstract class, (2) one interface, and (3) eight classes.

// This is the interface (2).
// IN SWIFT: Drop the word "Behavior" from WeaponBehavior, and drop the word "Weapon" from "useWeapon" (makes the code more Swiftlike, more readable).
protocol Weapon {
    func use()
}

// Here are four of the eight classes (3a).
// Note that ANY object could implement the Weapon behavior interface. Say, a paperclip, a tube of toothpaste, or a mutated sea bass.
class Knife: Weapon {
    func use() {
        print("Cutting with a knife")
    }
}

class BowAndArrow: Weapon {
    func use() {
        print("Using a bow and arrow")
    }
}

class Axe: Weapon {
    func use() {
        print("Chopping with an axe")
    }
}

class Sword: Weapon {
    func use() {
        print("Swinging a sword")
    }
}

// This is the "abstract" class (1).
// IN SWIFT: An abstract class with a partial concrete implementation could be implemented as a protocol with default implementation. However, due to a storage requirement (reference to a weapon), I chose to make it a class with a fight() method that must be overridden.
// IN SWIFT: "During a fight the useWeapon() method is called on the current weapon set for a given character to inflict great bodily damage on another character."
class Character {
    // A Character "HAS-A" Weapon behavior.
    var weapon: Weapon? = nil
    func fight() {
        self.weapon?.use()
    }
    func setWeapon(weapon: Weapon?){
        self.weapon = weapon
    }
}

// Here are the other four of the eight classes (3b).
class Queen: Character {
    override init() {
        super.init()
        self.weapon = Axe()
    }
}

class King: Character {
    override init() {
        super.init()
        self.weapon = BowAndArrow()
    }
}

class Knight: Character {
    override init(){
        super.init()
        self.weapon = Sword()
    }
}

class Troll: Character {
    override init(){
        super.init()
        self.weapon = Knife()
    }
}
// Example
let t = Troll()
t.fight()
t.setWeapon(weapon: nil)
t.fight()
t.setWeapon(weapon: Axe())
t.fight()
//: [Next](@next)
