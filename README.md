
# Object Oriented Programming
 It is a way of programming based on the concept of objects as an entity
 capable of storing data in form of fields and methods and operations that
 can be done on itself. An object can modify its fields giving the possibility
 of providing state and it can also interact with other objects.

 ### Advantages

* Code reuse.
* Encapsulation.
* Design benefits.

# Solid Principles
 Five design principles intended to make software designs more understandable, flexible and maintainable.

* **S**ingle Responsibility.
* **O**pen Closed.
* **L**iskov sustitution.
* **I**nterface segregation.
* **D**ependency Inversion.

##  Single Responsibility Principle

 If a class has more than one reason to change, it is then violating this principle.
 Responsibility = Reason to change.

### Problem statement

```swift
protocol EmailMessage {
    init(userName: String, email: String)

    func generateMessage(content: String)

    func sendMessage()
}
```

### Solution

```swift
protocol MessageContent {

}

protocol EmailMessage {
    init(userName: String, email: String)

    func generateMessage(content: String) -> MessageContent
}

protocol EmailSender {
    init(message: MessageContent)

    func sendMessage()
}
```


### Why separate by responsibilities? 

 Because a responsibility is a reason to change. If the requirements change, the class changes
 and so it’s responsibility. And if this class has more than one reason to change it can modify another
 behavior when it is not intended.

## Open Closed Principle

 A class must be open for extension but closed for modification.

The key of this principle are the abstractions. The interface provides a contract but at the samte time it gives

 me the freedom of implementation.

### Problem statement:

```swift
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
```

If a new shape needs to be added, the AreaCalculator needs to be modified hence violating the open closed principle.

### Solution:

```swift
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
```