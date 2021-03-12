//: [Previous](@previous)

import Foundation

/*:
 # Problem statement
*/

protocol EmailMessage {
    init(userName: String, email: String)

    func generateMessage(content: String)

    func sendMessage()
}


//: [Next](@next)
