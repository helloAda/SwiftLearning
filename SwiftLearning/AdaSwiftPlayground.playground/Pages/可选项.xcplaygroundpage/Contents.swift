


import Foundation


//原始的可选项定义
//可选项表示要么没有值 要么为某一类值
let x: Optional = 10
//简单的定义
let y: Int? = 20
print(y)


// '!'强行解包 - 从可选值中获取对应的非空值，但是如果是nil就会崩溃， 所以个人觉得程序中尽量少用'!'
print(y!)
//要先解包才能进行计算
print(x! + y!)

//let的可选项没有默认值
//var的可选项默认值为nil