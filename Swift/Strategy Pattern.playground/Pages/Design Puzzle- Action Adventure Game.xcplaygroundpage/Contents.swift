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
// IN SWIFT: This design puzzle doesn't explain about how fight() is implemented, or how it is called. The diagram indicates that each subclass implements it, so I take this to mean that fight() is the function used to draw weapons.
class Character {
    // A Character "HAS-A" Weapon behavior.
    var weapon: Weapon? = nil
    
    /* abstract */ func fight() {
        print("fight() MUST BE OVERRIDEN")
    }
}

// Here are the other four of the eight classes (3b).
class Queen: Character {
    override func fight() {
        weapon = Axe()
    }
}

class King: Character {
    override func fight() {
        weapon = BowAndArrow()
    }
}

class Knight: Character {
    override func fight() {
        weapon = Sword()
    }
}

class Troll: Character {
    override func fight() {
        weapon = Knife()
    }
}

//: [Next](@next)
