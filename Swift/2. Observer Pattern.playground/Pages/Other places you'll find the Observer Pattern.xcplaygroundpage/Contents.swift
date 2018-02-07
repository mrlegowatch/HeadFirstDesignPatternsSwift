//: [Previous](@previous)
//: # Other places you'll find the Observer Pattern
//:
//: This section parallels the book section on other places you'll find the Observer pattern in the JDK, notably in Swift.

// You'll find implementations of the Observer Pattern in other Apple frameworks, notably, UIKit and AppKit, specifically controls (such as menus and buttons), and more generally, IBActions. This example is designed to follow the Java Swing example from the book. In this example, we add a view with a button that has two listener actions.

import UIKit
import PlaygroundSupport

// Here are the class definitions for the observers.
class AngelListener: NSObject {
    @objc func actionPerformed(sender: AnyObject) {
        // Rather than update(), the actionPerformed() method gets called when the state in the subject (in this case the button) changes
        print("Don't do it, you might regret it!")
    }
}
class DevilListener: NSObject {
    @objc func actionPerformed(sender: AnyObject) {
        print("Come on, do it!")
    }
}

// Simple application that just creates a frame and throws a button in it.
var frame = CGRect(x:0, y:0, width:200, height:200)
var view = UIView(frame:frame)
let button = UIButton(type: .roundedRect)
button.frame = CGRect(x: 10, y: 10, width: 180, height: 22)
button.setTitle("Should I do it?", for: .normal)

// Makes the devil and angel object listeners (observers) of the button
let angelListener = AngelListener()
let devilListener = DevilListener()
button.addTarget(angelListener, action: #selector(AngelListener.actionPerformed), for: .touchUpInside)
button.addTarget(devilListener, action: #selector(DevilListener.actionPerformed), for: .touchUpInside)

view.addSubview(button)
PlaygroundPage.current.liveView = view
view

print("Hello")

//: [Next](@next)
