//: [Previous](@previous)

import Foundation

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
//: [Next](@next)
