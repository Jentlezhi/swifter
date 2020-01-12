//
//  main.swift
//  SwiftTestDemo
//
//  Created by Jentle on 2019/12/26.
//  Copyright © 2019 Jentle. All rights reserved.


enum Password {
    case number(Int, Int, Int, Int)
    case other
}
///内存对齐、引用类型分配的空间一般是16的倍数

///分配的大小
print(MemoryLayout<Password>.stride)
///实际的内存大小
print(MemoryLayout<Password>.size)
///内存对齐参数
print(MemoryLayout<Password>.alignment)


print("+++++++++++++++++++++++++++++++")

func sum(_ v1: Int,_ v2: Int) -> Int {
    
    return v1 + v2
}
 
let fn = sum
/*
 0x100001bb9 <+585>:  movq   %rcx, 0x6660(%rip)        ; SwiftTestDemo.fn : (Swift.Int, Swift.Int) -> Swift.Int
 0x100001bc0 <+592>:  movq   $0x0, 0x665d(%rip)        ; SwiftTestDemo.fn : (Swift.Int, Swift.Int) -> Swift.Int + 4
 
 movq: 传送8个字节，sum占16个字节，需要两次传送
 */
print(MemoryLayout.stride(ofValue: fn))

print("-------------------------------")

