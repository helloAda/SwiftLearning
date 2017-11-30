
import Foundation


//Swift的是类型自动推导的 option + click(鼠标点击)可查看
//Swift对类型要求严格 不同数据类型之间不能直接运算，不会像oc做默认的隐式转换

//常量
let x = 10
//变量
var y = 10

let z = 10.5
//错误的
//print(x + z)

//Swift中没有基本数据类型 大部分是结构体  下面的Int()构造函数也是
print(x + Int(z))


