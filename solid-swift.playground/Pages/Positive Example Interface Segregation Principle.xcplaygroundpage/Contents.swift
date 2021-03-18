//: [Previous](@previous)

import Foundation

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


//: [Next](@next)
