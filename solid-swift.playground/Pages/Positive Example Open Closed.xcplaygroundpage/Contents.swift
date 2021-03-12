//: [Previous](@previous)

import Foundation

protocol Shape {
    func calculateArea() -> Double
}

struct Circle: Shape {
    var radius: Double
    
    func calculateArea() -> Double {
        return Double.pi * radius * radius
    }
}

struct Square: Shape {
    var side: Double
    
    func calculateArea() -> Double {
        return side * side
    }
}

class AreaCalculator {
    static func calculateArea(shapes: [Shape]) -> Double {
        var result: Double = 0
        
        shapes.forEach({(shape: Shape) in
            result += shape.calculateArea()
        })
        
        return result
    }
}

//: [Next](@next)
