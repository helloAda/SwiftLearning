


//字符串字面量

let someString = "Some string literal value"


//多行字符串字面量

let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""

let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""
//换行符 \
let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""

//以行开始或者结束
let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""

//匹配代码缩进
let linesWithIndentation = """
    This line doesn't begin with whitespace.
        This line begins with four spaces.
    This line doesn't begin with whitespace.
    """

//特殊的字符在字符串字面量

//转义
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"

let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"


//多行字符串中 使用"""
let threeDoubleQuotationMarks = """
Escaping the first quotation mark \"""
Escaping all three quotation marks \"\"\"
"""



//初始化空字符串

var emptyString = ""
var anotherEmptyString = String()

if emptyString.isEmpty {
    print("Nothing to see here")
}


//字符串可变性

var variableString = "Horse"
variableString += " and carriage"

let constantString = "Highlander"
//constantString += " and another Highlander"



//字符串是值类型

/*
 Swift的String类型是值类型。 如果您创建了一个新的字符串，那么当其进行常量、变量赋值操作，或在函数/方法中传递时，会进行值拷贝。 任何情况下，都会对已有字符串值创建新副本，并对该新副本进行传递或赋值操作。 值类型在 结构体和枚举是值类型 中进行了详细描述。
 Swift默认字符串拷贝的方式保证了在函数/方法中传递的是字符串的值。 很明显无论该值来自于哪里，都是您独自拥有的。 您可以确信传递的字符串不会被修改，除非你自己去修改它。
 在实际编译时，Swift 编译器会优化字符串的使用，使实际的复制只发生在绝对必要的情况下，这意味着您将字符串作为值类型的同时可以获得极高的性能
 */


//使用字符
for character in "Dog!🐶" {
    print(character)
}

let exclamationMark: Character = "!"
let catCharacters:[Character] = ["C","a","t",            "!","🐱"]
let catString = String(catCharacters)
print(catString)


//连接字符串和字符

let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2

welcome.append(exclamationMark)


let badStart = """
one
two
"""

let end = """
three
"""

print(badStart + end)

let goodStart = """
one
two

"""

print(goodStart + end)


//字符串插值
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

//Unicode

/*
 
 Swift的String类型是基于Unicode标量建立的。Unicode标量是对应字符或者修饰符的唯一的21位数字
 Unicode码位(code poing) 的范围是U+0000到U+D7FF或者U+E000到U+10FFFF。Unicode标量不包括 Unicode代理项(surrogate pair) 码位，其码位范围是U+D800到U+DFFF
 
 */


//可扩展的字形集群

//每一个Swift的Character类型代表一个可扩展的字形群。一个可扩展的字形群是一个或多个可生成人类可读的字符Unicode标量的有序排列

let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}"

//可扩展的字符群集是一个灵活的方法，用许多复杂的脚本字符表示单一的Character值

let precomposed: Character = "\u{D55C}"
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"

let enclosedEAcute: Character = "\u{E9}\u{20DD}"

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"



//计算字符数量
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")


var word = "cafe"
print("the number of characters in \(word) is \(word.count)")

word += "\u{301}"
print("the number of characters in \(word) is \(word.count)")

/*
 可扩展的字符群集可以组成一个或者多个Unicode标量。这意味着不同的字符以及相同字符的不同表示方式可能需要不同数量的内存空间来存储。所以Swift中的字符在一个字符串中并不一定占用相同的内存空间数量。因此在没有获取字符串的可扩展的字符群的范围时候，就不能计算出字符串的字符数量。如果您正在处理一个长字符串，需要注意count属性必须遍历全部的Unicode标量，来确定字符串的字符数量。
 
 另外需要注意的是通过count属性返回的字符数量并不总是与包含相同字符的NSString的length属性相同。NSString的length属性是利用UTF-16表示的十六位代码单元数字，而不是Unicode可扩展的字符群集。作为佐证，当一个NSString的length属性被一个Swift的String值访问时，实际上是调用了utf16Count
 */


//访问和修改字符串

//字符串索引
/*
 startIndex 获取String的第一个Character的索引
 endIndex   获取String的最后一个Character的后一个位置的索引
 */

let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]

//越界
//greeting[greeting.endIndex]
//greeting.index(after: greeting.endIndex)


//遍历所有索引
for index in greeting.indices {
    print("\(greeting[index])", terminator: "")
}


//插入和删除

var welcome1 = "hello"
welcome1.insert("!", at: welcome1.endIndex)

welcome1.insert(contentsOf: " there", at: welcome1.index(before: welcome1.endIndex))

welcome1.remove(at: welcome1.index(before: welcome1.endIndex))
let range = welcome1.index(welcome1.endIndex, offsetBy: -6)..<welcome1.endIndex
welcome1.removeSubrange(range)


//截取字符串
let greeting1 = "Hello, world!"
let index1 = greeting1.index(of: ",") ?? greeting1.endIndex
let beginning = greeting1[..<index1]

let newString = String(beginning)



//比较字符串

//字符串/字符相等
let quotation1 = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation1 == sameQuotation {
    print("These two strings are considered equal")
}
/*
 如果两个字符串（或者两个字符）的可扩展的字形群集是标准相等的，那就认为它们是相等的。在这个情况下，即使可扩展的字形群集是有不同的 Unicode 标量构成的，只要它们有同样的语言意义和外观，就认为它们标准相等。
 */
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}

//英语的A和俄语的A虽然外观一样 但是语意不同
let latincapitalLetterA: Character = "\u{41}"
let cyrillicCapitalLetterA: Character = "\u{0410}"
if latincapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent.")
}


//前缀/后缀相等

let remeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in remeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        act1SceneCount += 1
    }
}

print("There are \(act1SceneCount) scenes in Act 1")

var mansionCount = 0
var cellCount = 0
for scene in remeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")


//字符串的Unicode表示形式

let dogString = "Dog!!🐶"

//UTF-8表示
for codeUnit in dogString.utf8 {
    print("\(codeUnit)", terminator: "")
}

//UTF-16表示
for codeUnit in dogString.utf16 {
    print("\(codeUnit)", terminator: "")
}

//Unicode标量表示
for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}

for scalar in dogString.unicodeScalars {
    print("\(scalar)")
}













