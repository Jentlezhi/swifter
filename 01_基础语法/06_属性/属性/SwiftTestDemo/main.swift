//
//  main.swift
//  SwiftTestDemo
//
//  Created by Jentle on 2019/12/26.
//  Copyright © 2019 Jentle. All rights reserved.

import SwiftUI

struct Circle {
    //存储属性
    var radius: Double
    //计算属性:本质上是函数，不占结构体的内存
    var diameter: Double {
        //Computed property must have accessors specified
        set{
            radius = newValue/2
        }
        get{
            radius*2
        }
    }
}

var c = Circle(radius: 3)
//print("diameter:\(c.diameter)")
c.radius = 11
c.diameter = 20
//print("radius:\(c.radius)")
//print(MemoryLayout.stride(ofValue: c))

//为了利于汇编分析：类型改为Int
struct Circle0 {
    //存储属性
    var radius: Int
    //计算属性:本质上是函数，不占结构体的内存
    var diameter: Int {
        //Computed property must have accessors specified
        set{
            radius = newValue/2
        }
        get{
            radius*2
        }
    }
}

var c0 = Circle0(radius: 3)
c0.radius = 11
c0.diameter = 20


//在创建类或结构体的实例时，必须为所有的存储属性设置一个合适的初始值
struct Point {
    var x: Int
    var y: Int
}
var point = Point(x: 0, y: 1)
//可以在初始化器里为存储属性设置一个初始值
struct Point0 {
    var x: Int
    var y: Int
    init() {
        x = 0
        y = 0
    }
}
var point0 = Point0()
//可以分配一个默认的属性值作为属性定义的一部分
struct Point1 {
    var x: Int = 0
    var y: Int = 0
}
var point1 = Point1()

//只读计算属性: 只有get,没有set
struct Point2 {
    var x: Int = 0
    var y: Int {
        get{
            10
        }
    }
}
var point2 = Point2()
//point2.y = 2 Cannot assign to property: 'y' is a get-only property

class Car {
    init() {
        print("Car init")
    }
    func run(){
        print("car run")
    }
}

class Person {
    
//    var car = Car()
    lazy var car = Car()
    init() {
        print("Person init")
    }
    func goOut(){
        car.run()
    }
}


var p = Person()
p.goOut()

//使用lazy可以定义一个延迟存储属性，在第一次用到属性的时候才会进行初始化
//   class Car {
//    init() {
//        print("Car init!")
//    }
//    func run() {
//        print("Car is running!")
//} }
//class Person {
//    lazy var car = Car()
//    init() {
//        print("Person init!")
//    }
//func goOut() { car.run()
//} }
// n lazy属性必须是var，不能是let plet必须在实例的初始化方法完成之前就拥有值
//n 如果多条线程同时第一次访问lazy属性 p无法保证属性只被初始化1次
//let p = Person() print("--------") p.goOut()
//Person init! --------
//Car init!
//Car is running!

//属性观察器
//可以为非lazy的var存储属性设置属性观察器
struct Circle1 {
    
    var radius: Double {
        willSet {
            print("willSet","newValue:\(newValue)")
        }
        didSet {
            print("didSet","oldValue:\(oldValue)","radius:\(radius)")
        }
    }
    init() {
        //radius = 1.0 这样写不会触发属性观察器
        self.radius = 1.0
        print("Circle1 init")
    }
}

var circle = Circle1()
circle.radius = 10


//willSet会传递新值，默认叫newValue
//didSet会传递旧值，默认叫oldValue
//在初始化器中设置属性值不会触发willSet和didSet p 在属性定义时设置初始值也不会触发willSet和didSet
