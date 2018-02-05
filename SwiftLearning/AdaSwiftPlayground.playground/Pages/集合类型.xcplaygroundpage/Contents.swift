


//Swift的Array、Set、Dictionary被实现为泛型集合

/*
 Swift语言中的Arrays、Sets和Dictionaries中存储的数据值类型必须明确。这意味着我们不能把不正确的数据类型插入其中。同时这也说明我们完全可以对取回值的类型非常自信
 */

//集合的可变性
//如果把集合分配给一个变量 就是可变的，如果分配给一个常量，那么它是不可变的。


//数组Array

//创建空数组
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")

someInts.append(3)
//因为上下文中已经提供了someInts的类型信息，所以可以使用空数组语句创建一个空数组
someInts = []


//创建带有默认值的数组
var threeDoubles = Array(repeating: 0.0, count: 3)


//通过两个数组相加创建数组
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles

//用数组字面量构造数组
var shoppingList: [String] = ["Eggs","Milk"]


//访问和修改数组

print("The shopping list contains \(shoppingList.count) items.")

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}

shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

var firstItem = shoppingList[0]
shoppingList[0] = "Six eggs"

shoppingList[4...6] = ["Bananas","Apples"]

//注:不可以用下标访问的形式去数组尾部添加新项

shoppingList.insert("Maple Syrup", at: 0)

shoppingList.remove(at: 0)

firstItem = shoppingList[0]

let apples = shoppingList.removeLast()


//数组的遍历

for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerated() {
    print("item \(index + 1): \(value)")
}




//集合

/*
 一个类型为了存储在集合中，该类型必须是可哈希化的--也就是说，该类型必须提供一个方法来计算它的哈希值。一个哈希值是Int类型的，相等的对象哈希值必须相同，比如a==b,因此必须a.hashValue == b.hashValue
 你可以使用你自定义的类型作为集合的值的类型或者是字典的键的类型，但你需要使你的自定义类型符合 Swift 标准库中的Hashable协议。符合Hashable协议的类型需要提供一个类型为Int的可读属性hashValue。由类型的hashValue属性返回的值不需要在同一程序的不同执行周期或者不同程序之间保持相同
 */


//创建一个空集合
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

letters.insert("a")
letters = []

//用字面量创建
//var favoriteGenres: Set<String> = ["Rock","Classical","Hip hop"]

var favoriteGenres: Set = ["Rock","Classical","Hip hop"]


//访问和修改一个集合

print("I have \(favoriteGenres.count) favorite music genres.")

if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}

favoriteGenres.insert("Jazz")

if let removeGenre = favoriteGenres.remove("Rock") {
    print("\(removeGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}


if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("it's too funky in here.")
}


//遍历一个集合
for genre in favoriteGenres {
    print("\(genre)")
}

//按照特定顺序遍历
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

//集合操作

let oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [0,2,4,6,8]
let singledigitPrimeNumbers: Set = [2,3,5,7]

oddDigits.union(evenDigits).sorted() //ab合并
oddDigits.intersection(evenDigits).sorted() //ab交集
oddDigits.subtracting(singledigitPrimeNumbers).sorted() //a不与b相交的部分
oddDigits.symmetricDifference(singledigitPrimeNumbers).sorted()//a.b不相交的部分

//集合成员关系和相等

let houseAnimals: Set = ["🐶","🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals) //a 是 b 的子集
farmAnimals.isSuperset(of: houseAnimals) //a 是 b 的父集合
farmAnimals.isDisjoint(with: cityAnimals) //a b不含有相同的值

/*
 使用isStrictSubset(of:)或者isStrictSuperset(of:)方法来判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等
  */




//字典
//字典中的Key类型必须遵循Hashable协议。


//创建一个空字典
var namesOfIntegers = [Int: String]()

namesOfIntegers[16] = "sixteen"
//上下文推断出字典的类型 可直接这样设置 Array Set Dictionary 都一样
namesOfIntegers = [:]


//用字面量创建字典
//var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]


//访问和修改字典

print("The dictionary of airports contains \(airports.count) items.")

if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}

airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"


//更新数据
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue)")
}

//获取数据
if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}

//移除数据
airports["APL"] = "Apple International"
airports["APL"] = nil

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB")
}


//遍历字典

for (airportCode, airportName) in airports {
    print("\(airportCode):\(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)




