


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
