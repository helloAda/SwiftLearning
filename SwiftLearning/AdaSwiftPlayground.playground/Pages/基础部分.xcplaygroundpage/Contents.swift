


//常量和变量

let maximumNumberOfLoginAttempts = 10 //常量
var currentLoginAttempt = 0 //变量

//声明多个可用逗号隔开
var x = 0.0, y = 0.0, z = 0.0

//类型标注
//声明一个类型为String名字为welcomeMessage的字符串
var welcomeMessage: String
welcomeMessage = "Hello"

//同样声明多个用逗号隔开
var red, green, blue: Double

//一般来说，不需要写类型标注，因为Swift是自动推断的

//可以使用任何字符命名包括Unicode字符
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

//注意:常量与变量名不能包含数学符号，箭头，保留的（或者非法的）Unicode 码位，连线与制表符。也不能以数字开头，但是可以在常量与变量名的其他地方包含数字

//可以更改现有的变量值为其他同类型的值 常量则不能更改
var friendlyWelcome = "Hello"
friendlyWelcome = "Bonjour!"

let languageName = "Swift"
//languageName = "Swift++"

//输出常量和变量

print(friendlyWelcome)
print("The current value of friendlyWelcome is \(friendlyWelcome)")


//注释

// This is a comment.
/* This is also a comment
 but is written over multiple lines. */

/* This is the start of the first multiline comment.
 /* This is the second, nested multiline comment. */
 This is the end of the first multiline comment. */

//分号
//不需要写分号，写了也没事，但是同一行内写多条独立语句的情况必须写分号
let cat = "🐱"; print(cat)

//整数
/*
 Swift 提供了8，16，32和64位的有符号和无符号整数类型
 UInt8 Int8 与C命名方式类似
 */

//整数范围
let minValue = UInt8.min
let maxValue = UInt8.max

/*
 Swift提供特殊的整数类型Int和无符号整数UInt 和当前平台原生字长相同
 32位平台 Int = Int32, UInt = UInt32
 
 除非需要特定长度的整数，一般来说Int足够了。
 尽量不要使用UInt,除非真的需要存储一个无符号整数,否则最好使用Int，即使你要存储的值是已经非负的。
 统一使用Int可以提高代码的可复用性，避免不同类型数字之间的转换，并且匹配数字的类型推断
 */


//浮点型
/*
 可以存储比Int类型更大或更小的数字
 Double表示64位浮点数 Float表示32位浮点数
 Double精确度很高，至少15位，Float只有6位，在两种类型都匹配的情况下将优先选择Double
 */


//类型安全和类型推断

/*
 类型安全的语言可以让你清楚地知道代码要处理的值的类型。如果你的代码需要一个String，你绝对不可能不小心传进去一个Int
 如果你没有显式指定类型，Swift会使用类型推断（type inference）来选择合适的类型
 */

let meaningOfLife = 42 //推断为Int
let pi = 3.14159 //推断为Double
let anotherPi = 3 + 0.14159 //推断为Double


//数值型字面量

//前缀:二进制0b 八进制0o 十六进制0x

let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInter = 0x11

//十进制指数 用e 十六进制用p
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1  // 1.21875 * 10^1
let hexadecimalDouble = 0xC.3p0 // 12.1875 * 2^0

//数值类字面量可以包括额外的格式来增强可读性。整数和浮点数都可以添加额外的零并且包含下划线，并不会影响字面量
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1


//数值型类型转换

//let cannotBeNegative: UInt8 = -1
//let tooBig: Int8.max + 1

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

//SomeType(ofInitialValue) 是调用 Swift 构造器并传入一个初始值的默认方法  例如上面:UInt16()


//整数和浮点数转换

//整数和浮点数转换必须显式指定类型
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi_a = Double(three) + pointOneFourOneFiveNine

let integerPi = Int(pi_a)


//类型别名

typealias AudioSample = UInt16

var maxAmplitudeFound = AudioSample.min


//布尔值
let orangesAreOrange = true
let turnipsAreDelicious = false


if turnipsAreDelicious {
    print("Mmm,tasty turnipsl")
} else {
    print("Eww,trunips are horrible")
}

//如果你在需要使用 Bool 类型的地方使用了非布尔值，Swift 的类型安全机制会报错

let i = 1
//if i {
//    //这是错误的
//}

if i == 1 {
    //这个例子会成功
}



// 元组
//元组把多个值组合成一个复合值。元组内的值可以是任意类型，并不要求是相同类型

let http404Error = (404, "Not Found")

//http404Error是一个类型为(Int, String)的元组

//分解元组
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

//如果只需要一部分数据 可以用 _ 代替
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")

//可以通过下标
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

//可以在定义的时候 给元组元素命名
let http200Status = (statusCode: 200, description: "OK")

//可以用过命名来分解
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")

//作为函数返回值，以及在临时组织值时很有用。但是不适合复杂的数据结构，如果不是临时使用的请使用类或者结构体


//可选类型

/*
 使用可选类型来处理值可能缺失的情况
 有值等于x,或者没有值
 */

/*
 C和Objective-C中并没有可选类型这个概念。最接近的是Objective-C中的一个特性一个方法要不返回一个对象要不返回nil，nil表示“缺少一个合法的对象”。然而，这只对对象起作用——对于结构体，基本的C类型或者枚举类型不起作用。对于这些类型，Objective-C方法一般会返回一个特殊值（比如NSNotFound来暗示值缺失。这种方法假设方法的调用者知道并记得对特殊值进行判断。Swift的可选类型可以让你暗示任意类型的值缺失，并不需要一个特殊值。
 */

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
/*
 convertedNumber 为Int?
 因为这个构造器Int()可能返回nil,因为不是所有字符串都能转换成数字 他返回的是一个可选类型 Int? 表示可能包含Int值，也可能不包含值
 */

//nil
//你可以给可选变量赋值nil表示没有值

var serverResponseCode: Int? = 404
serverResponseCode = nil

//nil 不能用于非可选的常量和变量，如果需要处理值缺失，请声明为对应的可选类型

var surveryAnswer: String? //可选类型没赋值，自动设置为nil

/*
 Swift的nil和Objective-C中的nil并不一样。在Objective-C中，nil 是一个指向不存在对象的指针。在Swift中，nil不是指针，它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设置为nil，不只是对象类型
 */


//if语句以及强制解析

if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}

//当你确定可选类型确实有值时，可以使用（!）来获取值。这个惊叹号表示，我知道这个可选值有值，请使用它。 这被称为强制解析

if convertedNumber != nil {
    print("convartedNumber has an integer value of \(convertedNumber!)")
}

//使用 ! 来获取一个不存在的可选值会导致运行时错误。使用 ! 来强制解析值之前，一定要确定可选包含一个非 nil 的值



//可选绑定

//使用可选绑定来判断可选类型是否包含值，如果包含就把值赋给一个临时常量或者变量。也可以在用在if和while语句中

if let actualNumber = Int(possibleNumber) {
    print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("\"\(possibleNumber)\" could not be converted to an integer")
}

//可以包含多个可选绑定或者多个布尔条件在一个if语句中，只要使用逗号分开就行。只要任务一个可选绑定的值为nil，或者任意一个布尔条件为false，整个if条件判断为false
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}

//隐式解析可选类型
//当可选类型被第一次赋值之后就可以确定之后一直有值，隐式解析可选类型非常有用。

//一个隐式解析可选类型其实就是一个普通的可选类型，但是可以被当做非可选类型来使用，并不需要每次都使用解析来获取可选值。

let possibleString: String? = "An optional string."
let forcedString: String = possibleString! //需要感叹号来取值

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString //不需要感叹号


//仍然可以把隐式解析可选类型当做普通可选类型来判断它是否包含值
if assumedString != nil {
    print(assumedString)
}
//可选绑定也一样
if let definiteString = assumedString {
    print(definiteString)
}

//如果一个变量之后可能变成nil的话请不要使用隐式解析可选类型。如果你需要在变量的生命周期中判断是否是nil的话，请使用普通可选类型


//错误处理

func canThrowAnError() throws {
    //这个函数有可能抛出错误
}

//一个函数可以通过在声明中添加throws来抛出错误消息 当函数能抛出错误消息时，应该在表达式的前面使用try

do {
    try canThrowAnError()
    //没有错误抛出
} catch {
    //有一个错误抛出
}

//一个do语句创建了一个新的包含作用域,使得错误能被传播到一个或多个catch从句

func makeASandwich() throws {
    // ...
}

enum SandwichError {
    case outOfCleanDishes
    case missingIngredients(_: String)
}

func eatASandwich () {
    
}

func washDishes () {
    
}

func buyGroceries (_: String) {
    
}
do {
    try makeASandwich()
    eatASandwich()
} catch SandwichError.outOfCleanDishes {
    washDishes()
} catch SandwichError.missingIngredients(let ingredients) {
    buyGroceries(ingredients)
}

//断言

let age = -3
assert(age >= 0, "A person's age cannot be less than zero")






