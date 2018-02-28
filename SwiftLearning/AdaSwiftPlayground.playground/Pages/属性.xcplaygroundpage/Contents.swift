

//属性

/*
 属性将值跟特定的类、结构或枚举关联。存储属性存储常量或变量作为实例的一部分，而计算属性计算（不是存储）一个值。计算属性可以用于类、结构体和枚举，存储属性只能用于类和结构体
 存储属性和计算属性通常与特定类型的实例关联。但是，属性也可以直接作用于类型本身，这种属性称为类型属性
 另外，还可以定义属性观察器来监控属性值的变化，以此来触发一个自定义的操作。属性观察器可以添加到自己定义的存储属性上，也可以添加到从父类继承的属性上
 */


//存储属性
//简单来说，一个存储属性就是存储在特定类或结构体实例理的一个常量或者变量。

struct FiexedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FiexedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6


//常量结构体的存储属性

//如果创建了一个结构体的实例并将其赋值给一个常量，则无法修改该实例的任何属性，即使属性是变量也不行。

let rangeOfFourItems = FiexedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 6 //这里会报错

/*
 这种行为是由于结构体属于值类型。当值类型的实例被声明为常量的时候，它的所有属性也就成了常量。
 
 属于引用类型的类则不一样。把一个引用类型的实例赋给一个常量后，仍然可以修改该实例的变量属性
 */


//延迟存储属性

//延迟存储属性是指当第一次被调用的时候才会计算其初始值的属性。在属性声明前使用 lazy 来标示一个延迟存储属性，必须声明成变量。

class DataImpoter {
    //假设这是一个负责将外部文件中的数据导入的类。这个类会初始化不少时间
    var fileName = "data.text"
    //这里会提供数据导入功能
}

class DataManager {
    lazy var impoter = DataImpoter()
    var data = [String]()
    //这里会提供数据管理功能
}

/*
 DataManager 管理数据时也可能不从文件中导入数据。所以当 DataManager 的实例被创建时，没必要创建一个 DataImporter 的实例，更明智的做法是第一次用到 DataImporter 的时候才去创建它
 */
let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")

//由于使用了 lazy ，importer 属性只有在第一次被访问的时候才被创建

print(manager.impoter.fileName)

//注意：如果一个被标记为 lazy 的属性在没有初始化时就同时被多个线程访问，则无法保证该属性只会被初始化一次
