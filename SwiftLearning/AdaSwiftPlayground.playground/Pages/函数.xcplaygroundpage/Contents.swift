


//函数

//函数的定义与调用

func greet(person: String) -> String {
    let greeting = "Hello," + person + "!"
    return greeting
}

/*
 func 函数前缀
 greet 函数名字
 person: String 参数名称: 参数类型
 -> String  返回值类型是字符串
 */

print(greet(person: "Anna"))
print(greet(person: "Brian"))

func greetAgain(person: String) -> String {
    return "Hello again," + person + "!"
}
print(greetAgain(person: "Anna"))


//函数参数与返回值

/*
 函数参数与返回值在 Swift 中非常的灵活。你可以定义任何类型的函数，包括从只带一个未命名参数的简单函数到复杂的带有表达性参数名和不同参数选项的复杂函数
 */

//无参数函数

func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())

//多参数函数
func greet(person: String, aleadyGreeted: Bool) -> String {
    if aleadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}

print(greet(person: "Tim", aleadyGreeted: true))


//无返回值函数
func greet1(person: String) {
    print("Hello, \(person)")
}
greet1(person: "Dave") //实际上依然返回了一个Void值，它是一个空元组


//被调用时，一个函数的返回值可以被忽略
func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}

func printWithCounting(string: String) {
    let _ = printAndCount(string: string)
}

printAndCount(string: "hello, world")
printWithCounting(string: "hello, world")


//多重返回值函数

func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")


//可选元组返回类型
func minMax1(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

if let bounds = minMax1(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}


//函数参数标签和参数名称

/*
 每个函数参数都有一个参数标签以及一个参数名称。参数标签在调用函数的时候使用。调用的时候需要将函数的参数标签写在对应的参数前面。参数名称在函数的实现中使用。默认情况下，函数参数使用参数名称来作为它们的参数标签
 */

func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // 在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值
}

func greet(person: String, hometown: String) -> String {
    return "Hello \(person)! Glad you could visit from \(hometown)"
}

print(greet(person: "Bill", hometown: "Cupertino"))


//忽略参数标签
func someFunction1(_ firstParameterName: Int, secondParameterName: Int) {

}

someFunction1(1, secondParameterName: 2)


//默认参数值
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // 如果你在调用时候不传第二个参数，parameterWithDefault 会值为 12 传入到函数体中
}

someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6)
someFunction(parameterWithoutDefault: 4)


// 可变参数

//可变参数的传入值在函数体中变为此类型的一个数组 变量类型名后面加...

func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

arithmeticMean(1, 2, 3, 4, 5)
arithmeticMean(3, 8.25, 18.75)


//输入输出参数

/*
 函数参数默认是常量。试图在函数体中更改参数值将会导致编译错误。这意味着你不能错误地更改参数值。如果你想要一个函数可以修改参数的值，并且想要在这些修改在函数调用结束后仍然存在，那么就应该把这个参数定义为输入输出参数
 
 你只能传递变量给输入输出参数。你不能传入常量或者字面量，因为这些量是不能被修改的。当传入的参数作为输入输出参数时，需要在参数名前加 & 符，表示这个值可以被函数修改
 
 输入输出参数 不能有默认值，而且可变参数不能用inout标记
 */

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swap(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")


//函数类型

//这两个函数 都是 (Int, Int) -> Int 类型
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

//这个是 () -> Void 没有返回值

func printHelloWorld() {
    print("hello, world")
}



//使用函数类型

//定义一个叫做mathFunction的变量，类型是 (Int, Int) -> Int ，并让这个新变量指向addTwoInts函数
var mathFunction: (Int, Int) -> Int = addTwoInts

print("Result: \(mathFunction(2, 3))")

//有相同匹配类型的不同函数可以被赋值给同一个变量，就像非函数类型的变量一样

mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")

//就像其他类型一样 Swift也会自动推断类型
let anotherMathFunction = addTwoInts


// 函数类型作为参数类型

/*
 它不关心传入函数是如何实现的，只关心传入的函数是不是一个正确的类型。这使得 printMathResult(_:_:_:) 能以一种类型安全（type-safe）的方式将一部分功能转给调用者实现
 */
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

printMathResult(addTwoInts, 3, 5)


//函数类型作为返回类型
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)

print("Counting to zero:")

while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")


//嵌套函数

func chooseStepFunction1(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}

var currentValue1 = -4
let moveNearerToZero1 = chooseStepFunction(backward: currentValue1 > 0)
while currentValue1 != 0 {
    print("\(currentValue1)... ")
    currentValue1 = moveNearerToZero1(currentValue1)
}
print("zero!")
