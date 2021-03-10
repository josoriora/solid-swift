//: [Previous](@previous)

import Foundation

/*:
 # Negative Example
 */

enum ShapeType {
    case circle
    case square
}

protocol Shape {
    var type: ShapeType { get }
}

struct Circle: Shape {
    let type: ShapeType = .circle
    var radius: Double
    
    func calculateCirculeArea() -> Double {
        return Double.pi * radius * radius
    }
}

struct Square: Shape {
    let type: ShapeType
    var side: Double
    
    func calculateSquareArea() -> Double {
        return side * side
    }
}

class AreaCalculator {
    static func calculateArea(shapes: [Shape]) -> Double {
        var result: Double = 0
        
        shapes.forEach({(shape: Shape) in
            switch shape.type {
            case .circle:
                result += (shape as! Circle).calculateCirculeArea()
            case .square:
                result += (shape as! Square).calculateSquareArea()
            }
        })
        
        return result
    }
}

/*:
 # Solution
 */


//: [Next](@next)
