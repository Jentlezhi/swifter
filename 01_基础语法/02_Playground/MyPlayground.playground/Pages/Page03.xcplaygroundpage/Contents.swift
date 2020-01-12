//: [Previous](@previous)

import Foundation

func add(v1: Int, v2: Int) -> Int {
    
    return v1 + v2
}

func minus(v1: Int, v2: Int) -> Int {
    
    return v1 - v2
}


func printResult(_ func: (Int,Int) -> Int,_ v1: Int,_ v2: Int) -> Int {
    
    return v1 + v2
}

printResult(add, 2, 3)

func next(with step: Int) -> Int {
    
    return step + 1
}

func previous(with step: Int) -> Int {
    
    return step - 1
}

func forward(_ forward: Bool) -> (Int) -> Int {
    
    forward ? next : previous
}

forward(false)(3)




//: [Next](@next)
