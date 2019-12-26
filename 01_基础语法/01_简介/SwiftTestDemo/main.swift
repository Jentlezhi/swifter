//
//  main.swift
//  SwiftTestDemo
//
//  Created by Jentle on 2019/12/26.
//  Copyright © 2019 Jentle. All rights reserved.
//

//import Foundation 1.这个也可以省略

//2.不用编写main函数，Swift将全局范围内的首句可执行代码作为程序入口
print("Hello, World!")

//3.一句代码尾部可以省略分号(;)，多句代码写到同一行时必须用分号(;)隔开
print("A")
print("B");print("C")

//4.用var定义变量，let定义常量，编译器能自动推断出变量\常量的类型
var name = "Jentle"
print(name)
name = "Rose"
print(name)

let familyName = "Zhi"
print(familyName)

let num = 4

let desc = "I have \(num) apples"
print(desc)

