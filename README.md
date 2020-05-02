 
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

protocol EmailMessageFixed {
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
