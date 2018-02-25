

//控制流


//for in

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}

let numberOfLegs = ["spider" : 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

for index in 1...5 {
    print("(index) times 5 is (index * 5)")
}

let base = 3
let power = 10
var answer = 1


for _ in 1...power {
    answer *= base
}

print("\(base) to the power of \(power) is \(answer)")


let minutes = 60
for tickMark in 0..<minutes {
    
}

let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
}

let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    // render the tick mark every 3 hours (3, 6, 9, 12)
}

//While 循环

//While, 每次在循环开始时，判断条件
//例子 蛇与梯子游戏
let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)

board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0
while square < finalSquare {
    //掷骰子
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1}
    //根据点数移动
    square += diceRoll
    if square < board.count {
        square += board[square]
    }
}
print("Game over!")


//repeat-while, 每次在循环结束时计算条件是否符合
square = 0
diceRoll = 0
repeat {
    square += board[square]
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1}
    //根据点数移动
    square += diceRoll
} while square < finalSquare
print("Game over!")


//条件语句

var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}

temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}

//多个if语句实现更多分支
temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}

//最后的else和其他语言一样 可选的
temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
}


//Switch语句

/*
 switch语句必须是完整的。每一个可能的值都必须至少有一个case分支与之对应。在某些不可能涵盖所有值的情况下，你可以使用默认（default）分支来涵盖其它所有没有对应的值，这个默认分支必须在switch语句的最后面
  */

let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}

//不存在隐式的贯穿

/*
 与C和Objective-C中的switch语句不同，在Swift中，当匹配的case分支中的代码执行完毕后，程序会终止switch语句，而不会继续执行下一个case分支。这也就是说，不需要在case分支中显式地使用break语句
  */

let anotherCharacter: Character = "a"
//switch anotherCharacter {
//case "a": // 无效，这个分支下面没有语句
//case "A":
//    print("The letter A")
//default:
//    print("Not the letter A")
//}

switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}


//区间匹配

let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")

//元组
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}


//值绑定
/*
 case分支允许将匹配的值绑定到一个临时的常量或变量，并且在case分支体内使用 —— 这种行为被称为值绑定
 */

let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with an y value of \(y)")
case (let x, let y):
    print("somewhere else at (\(x), \(y))")
}


//where
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}


//复合匹配
let someCharacter1: Character = "e"
switch someCharacter1 {
case "a","e","i","o","u":
    print("\(someCharacter1) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter1) is a consonant")
default:
    print("\(someCharacter1) is not a vowel or a consonant")
}


let stillanotherPoint = (9, 0)
switch stillanotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}


//控制转移语句

//continue

let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a","e","i","o","u"," "]
for character in puzzleInput {
    if charactersToRemove.contains(character) {
        continue
    } else {
        puzzleOutput.append(character)
    }
}


//break

/*
 当在一个循环体中使用break时，会立刻中断该循环体的执行，然后跳转到表示循环体结束的大括号(})后的第一行代码。不会再有本次循环的代码被执行，也不会再有下次的循环产生
 
 当在一个switch代码块中使用break时，会立即中断该switch代码块的执行，并且跳转到表示switch代码块结束的大括号(})后的第一行代码
  */
let numberSymbol: Character = "三"
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}


//贯穿

/*
 Swift中的switch不会从上一个case分支落入到下一个 case 分支中。相反，只要第一个匹配到的 case 分支完成了它需要执行的语句，整个switch代码块完成了它的执行
 但是可以使用fallthrough关键字
 */

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 15, 17, 19:
    description += "a prime number, and also"
    fallthrough
default:
    description += "an integer"
}
print(description)


//带标签的语句

//举例 还是蛇与梯子的 游戏 多了一条规则，必须落在第25个方格中。
square = 0
diceRoll = 0

//gameLoop就是标签
gameLoop: while square != finalSquare{
    diceRoll += 1
    if diceRoll == 7 {diceRoll = 1}
    switch square + diceRoll {
    case finalSquare:
        break gameLoop  //使用标签 这里中断的就是while语句
    case let newSquare where newSquare > finalSquare:
        continue gameLoop
    default:
        square += diceRoll
        square += board[square]
    }
}
print("Game over!")



//提前推出
func greet(person: [String: String]) {
    guard let name = person["name"] else { return }
    print("Hello \(name)")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "John"])
greet(person: ["name": "Jane", "location": "Cupertino"])


//检测API的可用性

if #available(iOS 10, macOS 10.12, *) {
    //在iOS 10 或者 macOS 10.12 使用的API
} else {
    //使用其他版本的API
}









