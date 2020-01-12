//
//  main.swift
//  SwiftTestDemo
//
//  Created by Jentle on 2019/12/26.
//  Copyright © 2019 Jentle. All rights reserved.

typealias Fn = (Int) -> Int

func getFn() -> Fn {
    ///局部变量
    var num = 0
    func plus(_ v: Int) -> Int{
        return v + num
    }
    num = 12
    return plus
}

let fun1 = getFn()
fun1(10)
fun1(1)

print("--------------------------------")

var num = 0
func getFn1() -> Fn {
    ///局部变量
    
    func plus(_ v: Int) -> Int{
        return v + num
    }
    num = 12
    return plus
}

let fun2 = getFn1()
print(fun2(10))
print(fun2(1))

print("--------------------------------")
var functions: [() -> Int] = []
for i in 1...3 {
//    func fn() -> Int {
//        return i
//    }
//    functions.append(fn)
//    functions.append({
//        () -> Int in
//        return i
//    })
//    functions.append(){
//        () -> Int in
//        return i
//    }
//    functions.append(){
//        return i
//    }
    functions.append{i}
}

for f in functions {
    print(f())
}

print("--------------------------------")
let names = ["Chris","Alex","Ewa","Barry","Daniella"]
//func backward(_ s1: String, _ s2: String) -> Bool {
//    return s1 > s2
//}
//var reversedNames = names.sorted(by: {
//    (_ s1: String, _ s2: String) -> Bool in
//    return s1 > s2
//})

///由于sorted(by areInIncreasingOrder: (Element, Element) throws -> Bool)
///可以推断出
//var reversedNames = names.sorted(by: {
//    s1, s2 in
//    return s1 > s2
//})
///单表达式闭包能够通过从它们的声明中删掉 return 关键字来隐式返回它们单个表达式的结果
//var reversedNames = names.sorted(by: {
//    s1, s2 in
//    return s1 > s2
//})
///Swift 自动对行内闭包提供简写实际参数名，你也可以通过 $0 , $1 , $2 等名字来引用闭包的实际参数值。
///in  关键字也能被省略
//var reversedNames = names.sorted(by: {
//    return $0 > $1
//})
///简单地传递一个大于号，并且 Swift 将推断你想使用大于号特殊字符串函数实现
var reversedNames = names.sorted(by:>)
print(reversedNames)

print("--------------------------------")
func getNumber() -> Int {
    
    print("getNumber")
    let a = 10
    let b = 10
    return a + b
}

//func getFirstProperty(_ v1: Int, _ v2: ()->Int ) -> Int {
//
//    print("getFirstProperty1")
//    return v1 > 0 ? v1 : v2()
//}

//print(getFirstProperty(-1){
//    let a = 10
//    let b = 20
//    return a + b
//})
///尾随闭包的简单写法：缺点 可读性差
//print(getFirstProperty(-1){100})
print("--------------------------------")
///自动闭包：
func getFirstProperty(_ v1: Int, _ v2 : @autoclosure () -> Int) -> Int {
    print("getFirstProperty2")
    return v1 > 0 ? v1 : v2()
}
print(getFirstProperty(9, 89))
print("--------------------------------")
var a : Int?
let b = 10
///public func ?? <T>(optional: T?, defaultValue: @autoclosure () throws -> T) rethrows -> T
print(a ?? b)
print(a ?? {
    return 90
    }())

