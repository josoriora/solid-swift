
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

## Liskov Substitution Principle

Also known as design by contract. Parent classes should be able to be replaced by chlid classes without modifying the behavior of the system.

Expressed in a formal way:

Given S is a subtype of T, then objects of type T can be replaced with objects of type S without altering any of the properties of the system

### Problem statement:

```swift
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
```



### Solution:

```swift
/*:
 Previous example had an issue when changing the height or the width
 of a square. Let's fix that issue.
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

/*:
 Current solution still breaks Liskov substitution principle and also breaks open closed principle.
 */
```

## Design by Contract:

Methods define preconditions and postconditions.

Preconditions cannot be strengthened in a subtype.

Postconditions cannot be weakened in a subtype.

Invariants of the supertype must be preserved in a subtype

We can talk about three different kind of contracts: invariant, precondition and post condition. Invariant is belonging to a class, pre- and post conditions are belonging to a method.

An invariant is nothing else than a restriction on the state of your class. The state of your class is basically the value of your class variables. For example if you have a class for right-angled triangles your class variables can be: the length of a side, the the length of b side and the the length of c side of the triangle. These variables with their current values represent the state of your class. We know the rule: a**a + b**b = c**c in case of a right-angled triangle. That means if our class stands for right-angled triangle all values which are not fulfilling this condition are invalid, they are not representing a right-angled triangle. So this logical expression (a**a + b**b = c**c) can be your class invariant. This should be true in all cases. It will be checked: at the end of your constructor, at starting any of your class methods and at the end of your class methods. Next to that it is a good practise to keep you class variables private and reach them through setter and getter functions, so that your class can never get an invalid state which is not fulfilling the invariant.

The precondition of a method is a condition checked before starting your method. For example if you have a stretch function for your triangle which is having a parameter called factor your precondition can be that this parameter is greater than 0.

The postcondifition of a method. is checked at the end of the function, it is describing what you are expecting from your method. In case of the stretch function in could be something similar: a = old(a) * *factor and b = old(b)* * factor and c = old(c) * factor, where old means the value at the start of the method. Here it is also important that you need to think about the whole state of your class. So if it has attributes which should not be changed by the method it should be also specified in the post condition. For example if your representation has also a colour attribute than the post condition should be extended with: colour = old(colour).

Until now it is simple: each method has a pre- and a postcondition and the class has an invariant which is checked after construction and at the start and at the end of each function.

Contracts for sub classes

How does it change if your class has a base class?

Your class is holding the invariant of all of its base classes. So in case of one base class the following needs to be always fulfilled: invariant_*of*_base_*class and invariant*_of_*your*_class. So from a child class you can not break the invariant of the base class.

For example if the right-angled triangle class is derived from a triangle class, an invariant for the triangle class can be: a + b >= c (the sum of length of the two shorter side should be at least the length of the longest side). This invariant should be fulfilled also by the right-angled triangles.

Regarding pre- and post condition:

For an overridden function precondition can not be strengthened as the precondition in the base class. So it can be less strength (like instead of (a < 10 and b < 10) just (a < 10)) or the same as in base class.

For an overridden function postcondition can not be weakened as the postcondition in the base class. So it can be the same or more strength.

And this is called Liskov substitution principle, which is part of SOLID principles.

Maybe it is a bit complicated for the first time, but it says nothing else than: your subclass is a special case of your base class, so it should work for all inputs which are working with the base class and it should produce the same results as well.

https://dev.to/rlxdprogrammer/design-by-contract---learn-something-new-about-oop-4jfd#:~:text=This%20principle%20is%20the%20following,desirable%20properties%20of%20that%20program%E2%80%9D

## Interface Segregation Principle:

Clients should not be forced to depedent on interfaces they don't use. When they are forced they are suceptible to interfaces changes which results in more coupling.

This priciple deals with the issues on fat interfaces.

### Problem Statement:

```swift
protocol Door: TimerClient {
    func lock()
    func unlock()
    func isDoorOpen() -> Bool
}

class Timer {
    func register(timeout: Int, client: TimerClient) {
        //Register time here
    }
}

protocol TimerClient {
    func timeout()
}

class TimedDoor: Door {
    func lock() {
        
    }
    
    func unlock() {
        
    }
    
    func isDoorOpen() -> Bool {
        false
    }
    
    func timeout() {
        
    }
}

class NormalDoor: Door {
    func lock() {
        
    }
    
    func unlock() {
        
    }
    
    func isDoorOpen() -> Bool {
        false
    }
    
    func timeout() {
        
    }
}

let timedDoor = TimedDoor()
let normalDoor = NormalDoor()
let timer = Timer()

timer.register(timeout: 30, client: timedDoor) // This code makes sense
timer.register(timeout: 30, client: normalDoor) // This one NOT.

/*
 This is interface pollution. Our interface is enforcing methods not needed by all the clients.
 */
```

### Solution:

```swift
protocol Door {
    func lock()
    func unlock()
    func isDoorOpen() -> Bool
}

class Timer {
    func register(timeout: Int, client: TimerClient) {
        //Register time here
    }
}

protocol TimerClient {
    func timeout()
}

class TimedDoor: Door, TimerClient {
    func lock() {
        
    }
    
    func unlock() {
        
    }
    
    func isDoorOpen() -> Bool {
        false
    }
    
    func timeout() {
        
    }
}

class NormalDoor: Door {
    func lock() {
        
    }
    
    func unlock() {
        
    }
    
    func isDoorOpen() -> Bool {
        false
    }
}

let timedDoor = TimedDoor()
let normalDoor = NormalDoor()
let timer = Timer()

timer.register(timeout: 30, client: timedDoor) // This code makes sense
//timer.register(timeout: 30, client: normalDoor) This whole line now it does not compile
```

## Dependeny inversion Principle:

High level module should not depend on a lower level module both should rely on abstractions. Expressed on another way abstractions should not depend on details, details should depend on abstractions.

We should always rely on abstractions.

### Problem Statement:

```swift
struct Minion {
    let name: String
}

class MinionService {
    func getTheMinions(completionHandler: ([Minion]) -> Void) {
        let result = [Minion(name: "Bob"), Minion(name: "Dave")]
        completionHandler(result)
    }
}

struct MinionServiceLogger {
    func printMinions(service: MinionService) {
        service.getTheMinions { (minions: [Minion]) in
            print(minions)
        }
    }
}

let service = MinionService()
let logger = MinionServiceLogger()

logger.printMinions(service: service)

/**
 How to make the interface extendable?
 What if the minions come from a web service, or maybe they come from a database?
 */
```

### Solution:

```swift
struct Minion {
    let name: String
}

protocol MinionService {
    func getTheMinions(completionHandler: ([Minion]) -> Void)
}

struct TwoMinionsService: MinionService {
    func getTheMinions(completionHandler: ([Minion]) -> Void) {
        let result = [Minion(name: "Bob"), Minion(name: "Dave")]
        completionHandler(result)
    }
}

struct FiveMinionsService: MinionService {
    func getTheMinions(completionHandler: ([Minion]) -> Void) {
        let result = [Minion(name: "Bob"),
                      Minion(name: "Dave"),
                      Minion(name: "Kevin"),
                      Minion(name: "Stuart"),
                      Minion(name: "Carl")]
        completionHandler(result)
    }
}

struct MinionServiceLogger {
    func printMinions(service: MinionService) {
        service.getTheMinions { (minions: [Minion]) in
            print(minions)
        }
    }
}

let twoMinionsService = TwoMinionsService()
let threeMinionsService = FiveMinionsService()
let logger = MinionServiceLogger()

logger.printMinions(service: twoMinionsService)
logger.printMinions(service: threeMinionsService)
```

### Recommendations:

- No variable should have a reference or pointer to a concrete class.

- No class should inherit from a concrete class.

- No method should overwrite a method already implemented on a base class.