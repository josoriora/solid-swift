//: [Previous](@previous)

import Foundation

class Rectangle {
    var height: Double
    var width: Double
    
    init(height: Double, width: Double) {
        self.height = height
        self.width = width
    }
}

class Square: Rectangle {
    
}

let square = Square(height: 5, width: 5)

square.height = 8
print("is square a square now? \(square.height == square.width)")

//: [Next](@next)
