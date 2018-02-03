



//术语
//运算符分为一元、二元和三元运算符，受运算符影响的值叫操作数

//赋值运算符
let b = 10
var a = 5
a = b

let (x,y) = (1,2)

//if x = y {
//    //这里错误 Swift的赋值操作不返回任何值，这个特性使你无法把 ==  错写成 =
//}


//算术运算符
1 + 2
5 - 3
2 * 3
10.0 / 2.5
//Swift不允许在数值运算中出现溢出情况，但是可以使用溢出运算符

//字符串也可以用加法运算符 拼接
"hello" + "world"

//求余运算符
9 % 4 // 1

-9 % 4 // -1


//一元负号运算符
let three = 3
let minusThree = -three
let plusThree = -minusThree
//一元正号运算符不做任何改变地返回操作数的值

//组合赋值运算符
var a_a = 1
a_a += 2


//比较运算符
1 == 1
2 != 1
2 > 1
1 < 2
1 >= 1
2 <= 1

//多用于if条件
let name = "world"
if name == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}

//元组也可以比较，但是Bool不能被比较，所以存有布尔类型的元组不能被比较
(1, "zebra") < (2, "apple")
(3, "apple") < (3, "bird")
(4, "dog") == (4, "dog")

("blue", -1) < ("purple", 1)
//("blue", false) < ("purple", true)  // Error because < can't compare Boolean values
/*
 Swift 标准库只能比较七个以内元素的元组比较函数。如果你的元组元素超过七个时，你需要自己实现比较运算符
 */


//三目运算符

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
//使用三目运算符代码更加简洁，但应该避免在一个语句中使用多个三目运算符


//空合运算符

/*
 空合运算符（a ?? b）将对可选类型 a 进行空判断，如果 a 包含一个值就进行解封，否则就返回一个默认值 b。表达式 a 必须是 Optional 类型。默认值 b 的类型必须要和 a 存储值的类型保持一致
 */

// a != nil ? a! : b


let defaultColorName = "red"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defaultColorName

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName


//区间运算符

//闭区间运算符
for index in 1...5 {
    print("\(index) * 5 = \(index * 5)")
}

//半开半闭区间运算符

let names = ["Anna","Alex","Brian","Jack"]
let count = names.count

for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}


//单向闭区间
for name in names[2...] {
    print(name)
}

for name in names[...2] {
    print(name)
}

//单向半开半闭区间
for name in names[..<2] {
    print(name)
}

let range = ...5
range.contains(7)
range.contains(4)
range.contains(-1)


//逻辑运算符

//逻辑非
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}

//逻辑与运算符
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}


//逻辑或运算符

let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

//逻辑运算符组合计算
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

//使用括号来明确优先级

if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}








