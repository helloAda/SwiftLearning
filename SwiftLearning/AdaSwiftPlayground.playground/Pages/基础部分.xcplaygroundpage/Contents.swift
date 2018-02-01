


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









