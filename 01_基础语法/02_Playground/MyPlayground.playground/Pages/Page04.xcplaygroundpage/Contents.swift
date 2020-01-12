//: [Previous](@previous)

import Foundation

enum Score{
    case points(Int)
    case grade(Character)
}

enum Score1{
    case points(score:Int)
    case grade(rank:Character)
}

var score = Score.points(98)

switch score {
case .points:
    
    print(score)
case .grade:
    print(score)
}

switch score {
case let .points(i):
    print("grade is \(i)")
case let .grade(i):
    print("grade is \(i)")
}


score = .grade("A")

switch score {
case .points(let i):
    print("points is \(i)")
case .grade(let i):
    print("grade is \(i)")
}

enum Direction : String {
    
    case north, south, west, east
}

print(Direction.north.rawValue)

let age = 10


enum Season : String {
    case spring = "春天"
    case summer = "夏天"
    case autumn = "秋天"
    case winter = "冬天"
}
var season = Season.spring
switch season {
case .spring:
    fallthrough
case .summer:
    print(Season.summer.rawValue)
case .autumn:
    print(Season.autumn.rawValue)
case .winter:
    print(Season.winter.rawValue)
}

enum Season1 : Int {
    case spring = 1, summer, autumn, winter
}
MemoryLayout<Season1>.size
MemoryLayout<Season1>.stride
MemoryLayout<Season1>.alignment


//: [Next](@next)
