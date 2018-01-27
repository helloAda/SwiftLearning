
import Foundation

// MARK: ----------- 简单值 ---------------


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
var shoppingList = ["catfish","water","tulips","blue paint"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm" : "Captain",
    "Kaylee" : "Mechanic",
]
occupations["Jayne"] = "Public Relations"

//字典、数组初始化
let emptyArray = [String]()
let emptyDictionary = [String: Float]()
//也可以自动推断出来
shoppingList = []
occupations = [:]





// MARK: ------------- 控制流--------------

//包裹条件和循环变量括号可以省略，但是语句体的大括号是必须的
let individualScores = [75,43,103,87,12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

//像if score{...} 这样的语句是错误，不会隐式的与0做比较 if条件必须是一个布尔表达式
//可以使用if let 来处理值缺失的情况 即nil
var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"

if let name = optionalName {
    greeting = "Hello,\(name)"
}

//如果变量为nil 跳过代码块 可以使用??操作符来提供一个默认值。
optionalName = nil;
if let name = optionalName {
    greeting = "Hello,\(name)"
} else {
    greeting = "Hello"
}

let nickName: String? = nil;
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"


//Switch支持任意类型的数据以及各种比较操作 不需要break 匹配到后不会继续运行

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber","watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("is it a spict \(x)?")
default:
    print("Everything tastes good in soup.")
}


//可以使用for in 来遍历字典
let interestiongNumbers = [
    "prime": [2,3,5,7,11,13],
    "Fibonacci": [1,1,2,3,5,8],
    "Square": [1, 4, 9, 16, 25],
]

var largest = 0

for (_,numbers) in interestiongNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)


//while循环条件也可以在结尾，保证至少循环一次
var n = 2
while n < 100 {
    n = n * 2
}
print(n)

var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)

//在循环中使用..<来表示范围 包含的话使用...
var total = 0
for i in 0..<4 {
    total += i
}
print(total)





// MARK: ------------- 函数和闭包 ----------------

//使用func来声明一个函数，使用名字和参数来调用函数。使用->来指定函数返回值的类型
func greet (person: String, day: String) -> String {
    return "Hello \(person),today is \(day)."
}

greet(person:"Bob",day:"Tuesday")

//可以自定义参数标签，也可以使用 _ 表示使用参数标签
func greet (_ person: String, on day:String) -> String {
    return "Hello \(person),today is \(day)."
}

greet("John",on:"Wednesday")

//使用元组来让一个函数返回多个值，该元组的元素可以用名称或数组来表示

func calculateStatistics (scores:[Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    return (min,max,sum)
}

let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)

//函数可以嵌套，嵌套函数可以访问在外部声明的变量 可以用来重构一个太长太复杂的函数

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}

returnFifteen()

//函数可以作为另一个函数的返回值

func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number;
    }
    return addOne
}

var increment = makeIncrementer()
increment(7)

//函数也可以当作参数传入另一个函数
func hasAnyMatches(list:[Int],condition:(Int) -> Bool) ->Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

//函数实际上是一种特殊的闭包(代码块可以在之后被调用) 可以使用{}来创建一个匿名闭包,使用in将参数和返回值类型声明与闭包函数体进行分离
numbers.map({
    //参数 返回值
    (number:Int) -> Int in
    //函数体
    let result = 3 * number
    return result
})


//闭包作为回调函数，可以忽略参数类型和返回值 单个语句闭包会把它当作结果返回

let mappedNumbers = numbers.map({number in 3 * number})
print(mappedNumbers)


//可以使用参数的位置来引用参数，闭包作为最后一个参数时，可以省略括号
let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)




// MARK:   ------------ 对象、类-------------

class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
    
}

var shape = Shape()

shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()


//注意self被用来区别实例变量。当你创建实例的时候，像传入函数参数一样给类传入构造器(init)的参数
class NameShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name:String) {
        self.name = name;
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
}

//子类继承 重写父类方法需要 override
class Square: NameShape {
    var sideLength: Double
    
    init(sideLength: Double,name: String) {
        self.sideLength = sideLength;
        super.init(name: name);
        numberOfSides = 4;
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

let test = Square(sideLength: 5.2,name:"my test square")
test.area()
test.simpleDescription

//除了简单的存储属性外，属性还有getter setter

class EquilateralTriangle: NameShape {
    var sideLength: Double = 0.0
    
    init(sideLength:Double, name:String) {
        self.sideLength = sideLength;
        super.init(name: name);
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name:"a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)


//如果不需要计算属性，但是仍然想在设置新值前后运行代码，可以使用willSet didSet

class TriangleAndSquare {
    
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)

let optionalSquare: Square? = Square(sideLength: 2.5, name: "option square")
let sideLength = optionalSquare?.sideLength



// MARK: 枚举和结构体

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.ace
let aceRawValue = ace.rawValue

if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
    print(threeDescription)
}

//  枚举的成员值是实际值，并不是原始值的另一种表达方法。如果没有比较有意义的原始值，就不需要提供原始值

enum Suit {
    case spades,hearts,diamonds,clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}

let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()

// 一个枚举成员的实例可以有实例值。相同枚举成员的实例可以有不同的值。创建实例的时候传入值即可

enum ServerResponse {
    case result(String,String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset)")
case let .failure(message):
    print("Failure...  \(message)")
}


















