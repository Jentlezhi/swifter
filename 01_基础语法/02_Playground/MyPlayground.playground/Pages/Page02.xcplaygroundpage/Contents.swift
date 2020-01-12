//: [上一页](@previous)

/*:
 if条件可以省去小括号
 
 但是后面的大括号的不可以省略
 
 */
let a = 8
if a > 6 {
    print("a is biger than 6")
}else{
    print("a is smaller than 6")
}
/*:
 区间运算符：
 a...b 闭区间
*/
let name = ["a","b","c","d","e"]
for i in 0...name.count-1 {
    print(name[i])
}

for i in 0..<name.count {
    print(name[i])
}
print("------------------")
for i in 0..<6 {
    print(i)
}
print("------------------")
for i in 0...6 {
    print(i)
}

let range = ..<5
print(Int.min)
print(Int64.min)
print(range.contains(4))
print(range.contains(5))
//print(range.contains(Int64.min))

let c = 43
print(c<<1)


//: [下一页](@next)
