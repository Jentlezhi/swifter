//
//  main.swift
//  SwiftTestDemo
//
//  Created by Jentle on 2019/12/26.
//  Copyright © 2019 Jentle. All rights reserved.
//  关闭内联优化：

////import Foundation 1.这个也可以省略
//
////2.不用编写main函数，Swift将全局范围内的首句可执行代码作为程序入口
//print("Hello, World!")
//
////3.一句代码尾部可以省略分号(;)，多句代码写到同一行时必须用分号(;)隔开
//print("A")
//print("B");print("C")
//
////4.用var定义变量，let定义常量，编译器能自动推断出变量\常量的类型
//var name = "Jentle"
//print(name)
//name = "Rose"
//print(name)
//
//let familyName = "Zhi"
//print(familyName)
//
//let num = 4
//
//let desc = "I have \(num) apples"
//print(desc)


//var number = 10
//func test(_ num1: inout Int) -> () {
//
//    num1 = 20
//}
//test(&number)

//func testClassAndStruct() {
//
//    class Size {
//        var width = 1
//        var height = 2
//    }
//
//    struct Point {
//        var x = 3
//        var y = 4
//    }
//}


//func testStruct() {
//    struct Point {
//        var x : Int
//        var y : Int
//        init() {
//            x = 0
//            y = 0
//        }
//    }
//    let p = Point()
//    print(p)
//}
//
//testStruct()



/////编译器优化
//
//func test(){
//    
//    print("test")
//}
//test()
//
/////控制内联：不内联
//@inline(never) func test1(){
//    
//    print("test1")
//}
//test1()
//
/////控制内联：内联（递归以及动态派发的函数除外）
//@inline(__always) func test2(){
//    
//    print("test2")
//}
//test2()
// 
///* 关闭
//     0x100000e50 <+0>:  pushq  %rbp
//     0x100000e51 <+1>:  movq   %rsp, %rbp
//     0x100000e54 <+4>:  subq   $0x10, %rsp
//     0x100000e58 <+8>:  movl   %edi, -0x4(%rbp)
//     0x100000e5b <+11>: movq   %rsi, -0x10(%rbp)
// ->  0x100000e5f <+15>: callq  0x100000e70               ; SwiftTestDemo.test() -> () at main.swift:41
//     0x100000e64 <+20>: xorl   %eax, %eax
//     0x100000e66 <+22>: addq   $0x10, %rsp
//     0x100000e6a <+26>: popq   %rbp
//     0x100000e6b <+27>: retq
// */
//
///*开启
// SwiftTestDemo`main:
//     0x100000e00 <+0>:   pushq  %rbp
//     0x100000e01 <+1>:   movq   %rsp, %rbp
//     0x100000e04 <+4>:   pushq  %rbx
//     0x100000e05 <+5>:   pushq  %rax
//     0x100000e06 <+6>:   movq   0x121b(%rip), %rdi        ; lazy cache variable for type metadata for Swift._ContiguousArrayStorage<Any>
//     0x100000e0d <+13>:  testq  %rdi, %rdi
//     0x100000e10 <+16>:  jne    0x100000e33               ; <+51> [inlined] generic specialization <Any> of Swift._allocateUninitializedArray<A>(Builtin.Word) -> (Swift.Array<A>, Builtin.RawPointer) + 47 at main.swift:44
//     0x100000e12 <+18>:  movq   0x1ef(%rip), %rsi         ; (void *)0x00007fff87ae5908: type metadata for Any
//     0x100000e19 <+25>:  addq   $0x8, %rsi
//     0x100000e1d <+29>:  xorl   %edi, %edi
//     0x100000e1f <+31>:  callq  0x100000f4e               ; symbol stub for: type metadata accessor for Swift._ContiguousArrayStorage
//     0x100000e24 <+36>:  movq   %rax, %rdi
//     0x100000e27 <+39>:  testq  %rdx, %rdx
//     0x100000e2a <+42>:  jne    0x100000e33               ; <+51> [inlined] generic specialization <Any> of Swift._allocateUninitializedArray<A>(Builtin.Word) -> (Swift.Array<A>, Builtin.RawPointer) + 47 at main.swift:44
//     0x100000e2c <+44>:  movq   %rdi, 0x11f5(%rip)        ; lazy cache variable for type metadata for Swift._ContiguousArrayStorage<Any>
//     0x100000e33 <+51>:  movl   $0x40, %esi
//     0x100000e38 <+56>:  movl   $0x7, %edx
//     0x100000e3d <+61>:  callq  0x100000f5a               ; symbol stub for: swift_allocObject
//     0x100000e42 <+66>:  movq   %rax, %rbx
//     0x100000e45 <+69>:  movaps 0x154(%rip), %xmm0
//     0x100000e4c <+76>:  movups %xmm0, 0x10(%rax)
// ->  0x100000e50 <+80>:  movq   0x1a9(%rip), %rax         ; (void *)0x00007fff87addbc8: type metadata for Swift.String
//     0x100000e57 <+87>:  movq   %rax, 0x38(%rbx)
//     0x100000e5b <+91>:  movq   $0x74736574, 0x20(%rbx)   ; imm = 0x74736574
//     0x100000e63 <+99>:  movabsq $-0x1c00000000000000, %rax ; imm = 0xE400000000000000
//     0x100000e6d <+109>: movq   %rax, 0x28(%rbx)
//     0x100000e71 <+113>: movabsq $-0x1f00000000000000, %rdx ; imm = 0xE100000000000000
//     0x100000e7b <+123>: movl   $0x20, %esi
//     0x100000e80 <+128>: movl   $0xa, %ecx
//     0x100000e85 <+133>: movq   %rbx, %rdi
//     0x100000e88 <+136>: movq   %rdx, %r8
//     0x100000e8b <+139>: callq  0x100000f54               ; symbol stub for: Swift.print(_: Any..., separator: Swift.String, terminator: Swift.String) -> ()
//     0x100000e90 <+144>: movq   %rbx, %rdi
//     0x100000e93 <+147>: callq  0x100000f60               ; symbol stub for: swift_release
//     0x100000e98 <+152>: xorl   %eax, %eax
//     0x100000e9a <+154>: addq   $0x8, %rsp
//     0x100000e9e <+158>: popq   %rbx
//     0x100000e9f <+159>: popq   %rbp
//     0x100000ea0 <+160>: retq
//
// */
//
//
//func testDemo(){
//  
//    let a = 3
//    let b = a + 1
//    print(b)
//}
//print("hello")
//testDemo()
//print("world")
//
//
//enum TestEnum {
//    case test1(Int, Int, Int)
//    case test2(Int, Int)
//    case test3(Int)
//    case test4(Bool)
//    case test5
//}
//
//var e = TestEnum.test1(10, 20, 30)
///*
// register read rip rip = 0x0000000100001358
// movq   $0xa,  0x1cf0(%rip) //10 内存地址：rip + 0x1cf0 : 即是e的地址:0x100003048
// movq   $0x14, 0x1ce6(%rip) //20 内存地址：rip + 0x1ce6
// movq   $0x1e, 0x1ce3(%rip) //30 内存地址：rip + 0x1ce3
// movb   $0x0,  0x1ce4(%rip)
// */
//switch e {
//case let .test1(v1, v2, v3):
//    print("test1",v1,v2,v3)
//case let .test2(v1, v2):
//    print("test2",v1,v2)
//case let .test3(v1):
//    print("test3",v1)
//case let .test4(v1):
//    print("test4",v1)
//case .test5:
//    print("test5")
//}
//

func test1() {
    
    print("test1")
}

class Person {
    
    func test2() {
        var a = 10
        print("局部变量：\(Mems.memBytes(ofVal: &a))")
        print("test2:\(a)")
    }
}

///0x100001c00
test1()

var p = Person()
///0x100001d40
p.test2()


///0x0000000100008358
print("全局变量：\(Mems.ptr(ofVal: &p))")

///0x0000000102847ef0
print("堆空间：\(Mems.ptr(ofRef: p))")

/*
 test1:         0x100001c00
 Person.test2:  0x100001d40
 全局变量：       0x100008358
 堆空间：         0x102847ef0
 */


