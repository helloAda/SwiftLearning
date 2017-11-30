
import Foundation


// --------- for -----------

// 区间[0,5)
for i in 0..<5 {
    print(i)
}
print("-------")
// 区间[0,5]
for i in 0...5 {
    print(i)
}
//  range是类型 CountableRange<Int>
//  rannge1是类型 CountableClosedRange<Int>  option + click(单击)看类型
//  所以书写时 不能0 ..< 5 有空格 否则不是该类型 报错
let range = 0..<5
let range1 = 0...5

print("========")
//反序
for i in range.reversed(){
    print(i)
}
