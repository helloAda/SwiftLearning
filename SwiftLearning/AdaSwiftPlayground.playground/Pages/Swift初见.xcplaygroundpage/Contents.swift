
import Foundation

// MARK: ----------- 简单值


//Swift的是类型自动推导的 option + click(鼠标点击)可查看

//变量
var myVariable = 42
myVariable = 50
//常量
let myConstant = 42


//隐式
let implicitInteger = 70
let implicitDouble = 70.0
//显式
let explicitDouble : Double = 70.0
let explicitFloat : Float = 4.0

//值永远不会被隐式转换成其它类型，需要显式转换

let lable = "The width is"
let width = 94
let widthLable = lable + String(width)
//let widthLable = lable + width //错误

//也可以通过 \(value) 转换成字符串
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I habe \(apples + oranges) pieces of fruit."

//也可以通过 """ 三个双引号 构造多行字符串
let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""

//使用[]创建字典和数组 使用下标 或者 key来访问


