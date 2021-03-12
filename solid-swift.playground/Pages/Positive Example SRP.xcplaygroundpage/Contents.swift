//: [Previous](@previous)

import Foundation

/*:
 # Solution
*/

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

/*:
 # Why separate by responsibilities?

 Because a responsibility is a reason to change. If the requierements change, the class changes
 and so its responsibility. And if this class has more than one reason to change it can modify another
 behavior when it is not intended.
*/


//: [Next](@next)
