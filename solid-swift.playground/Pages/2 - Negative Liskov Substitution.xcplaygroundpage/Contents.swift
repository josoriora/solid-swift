//: [Previous](@previous)

import Foundation

/*:
 Previous example had an issue when changing the height or the width
 of a square. Let fix that issue.
 */

class Rectangle {
    private var height: Double
    private var width: Double
    
    init(height: Double, width: Double) {
        self.height = height
        self.width = width
    }
    
    func setHeight(_ height: Double) {
        self.height = height
    }
    
    func getHeight() -> Double {
        self.height
    }
    
    func setWidth(_ width: Double) {
        self.width = width
    }
    
    func getWidth() -> Double {
        self.width
    }
}

class Square: Rectangle {
    override func setHeight(_ height: Double) {
        super.setHeight(height)
        super.setWidth(height)
    }
    
    override func setWidth(_ width: Double) {
        super.setWidth(width)
        super.setHeight(width)
    }
}

let square = Square(height: 5, width: 5)

square.setHeight(8)
print("is square a square now? \(square.getHeight() == square.getWidth())")

class Process {
    static func process(rectangle: Rectangle) -> Double {
        rectangle.setWidth(5)
        rectangle.setHeight(4)
        
        return rectangle.getWidth() * rectangle.getHeight()
    }
}


let rectangle = Rectangle(height: 2, width: 3)

print("is area 20 after process? \(Process.process(rectangle: rectangle) == 20)")
print("is area 20 after process? \(Process.process(rectangle: square) == 20)")


//: [Next](@next)
