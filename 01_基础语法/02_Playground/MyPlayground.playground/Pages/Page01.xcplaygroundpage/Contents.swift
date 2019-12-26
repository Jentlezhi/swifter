import UIKit


//: [上一页](@previous)

var str = "Hello, playground"

let a = 10
let b = 20
let c = a + b


import PlaygroundSupport
let view = UIView()
view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
view.backgroundColor = .red
PlaygroundPage.current.liveView = view

let view1 = UIView()
view1.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
view1.backgroundColor = .yellow
PlaygroundPage.current.liveView = view1

func 😘😘(){
    print("I Love you")
}
😘😘()

print(Int8.max)
print(Int.max)

//元祖
let error = (404,"Not Found!")
error.0
error.1

let (statusCode,statusDesc) = error
statusCode
statusDesc

let (anotherStatusCode,_) = error
anotherStatusCode
//添加标签
let http200Status = (statusCode: 200,desc: "ok")
http200Status.statusCode
http200Status.desc

