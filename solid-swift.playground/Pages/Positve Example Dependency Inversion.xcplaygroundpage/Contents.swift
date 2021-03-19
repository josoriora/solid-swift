//: [Previous](@previous)

import Foundation

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

//: [Next](@next)
