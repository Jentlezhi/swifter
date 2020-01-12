//
//  main.swift
//  SwiftTestDemo
//
//  Created by Jentle on 2019/12/26.
//  Copyright © 2019 Jentle. All rights reserved.


func sum(_ v1: Int, _ v2: Int) -> Int { v1 + v2}
print(sum(7, 3))

///闭包定义函数：
var fun = {
    (v1: Int, v2: Int) -> Int in
    return v1 + v2
}
print(fun(2,3))

//func exec(v1: Int, v2: Int, fun:(Int,Int) -> Int) -> Int {
//
//    return fun(v1,v2)
//}
//
//func minus(_ v1: Int, _ v2: Int) -> Int {
//
//    return v1 - v2
//}

func exec(v1: Int, v2: Int, fun:(Int,Int) -> Int) -> Int {
    
    return fun(v1,v2)
}

//func minus(_ v1: Int, _ v2: Int) -> Int {
//
//    return v1 - v2
//}

//print(exec(v1: 12,v2: 4,fun: {
//    (_ v1: Int, _ v2: Int) in
//    return v1 - v2
//}))

//print(exec(v1: 12,v2: 4,fun: {
//    (_ v1, _ v2) in
//    return v1 - v2
//}))

//print(exec(v1: 12,v2: 4,fun: {
//    v1,v2 in return v1 - v2
//}))

//print(exec(v1: 12,v2: 4,fun: {
//    v1,v2 in v1 - v2
//}))

//print(exec(v1: 12,v2: 4,fun: { $0 - $1}))

//print(exec(v1: 12,v2: 4,fun: - ))

///尾随闭包：
//print(exec(v1: 2,v2: 9){
//    $0 * $1
//})


///如果闭包是函数的唯一实参，而且使用了尾随闭包的写法，那就不需要在函数后面写圆括号
print("------------------------")
func exec1(fun: (Int, Int) -> Int) -> Int{
    
    return fun(-1,9)
}

//print(exec1(){return $0 * $1})
print(exec1{return $0 * $1})

print("----------testSort-----------")
func testSort() {
    
    var names = ["Chris","Alex","Ewa","Barry","Daniella"]
//    names.sort { (_ s1: String, _ s2: String) -> Bool in
//
//        return s1 > s2
//    }
//    names.sort { (_ s1, _ s2) -> Bool in
//
//        return s1 > s2
//    }
//    names.sort { s1,s2 -> Bool in
//
//        return s1 > s2
//    }
//    names.sort { s1,s2 -> Bool in
//
//         s1 > s2
//    }
    
//    names.sort { $0 > $1}
    
    names.sort(by: >)
    print(names)
}

testSort()

print("---------testIgnorePars------------")

func testIgnorePars(){
    
//    func exec2(fun:(_ v1: Int, _ v2: Int) -> ()) -> () {
//        fun(0,0)
//    }
    func exec2(fun:(_ v1: Int, _ v2: Int) -> ()) {
        fun(0,0)
    }
    
    exec2{
        (_,_) in
        print("Hello")
    }
}
testIgnorePars()

print("---------testCapturePars------------")
func testCapturePars(){
    typealias Fn = (Int) -> Int
     func getFn() -> Fn {
        
        var num = 0
//        func plus(_ i: Int) -> Int {
//
//            num += i
//            return num
//        }
//        return plus
        return {
            num += $0
            return num
        }
    }

    let fun2 = getFn()
    print(fun2(1))//1
    print(fun2(2))//3
    print(fun2(3))//6
    print(fun2(4))//10
    print(fun2(5))//15
}
testCapturePars()

