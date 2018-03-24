

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


//存储属性和实例变量

//Objective-C 为类实例存储值和引用提供两种方法。除了属性之外，还可以使用实例变量作为属性值的后端存储。

//Swift 编程语言中把这些理论统一用属性来实现。Swift 中的属性没有对应的实例变量，属性的后端存储也无法直接访问。这就避免了不同场景下访问方式的困扰，同时也将属性的定义简化成一个语句。属性的全部信息——包括命名、类型和内存管理特征——都在唯一一个地方（类型定义中）定义。


//计算属性

//计算属性不直接存储值，而是提供一个getter和可选的setter，来间接获取和设置其他属性或变量的值。计算属性一定要用var

struct Point{
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y:centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x:0.0, y:0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")


//简化setter声明
//setter 新值默认名称newValue
struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y:centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
    
}


//只读计算属性
//只有getter没有setter的计算属性就是只读计算属性，只读计算属性可以去掉get关键字和{}。

struct Coboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

let fourByFiveByTwo = Coboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")


//属性观察器

/*
 可以为除了延迟存储属性之外的其他存储属性添加属性观察器，也可以通过重写属性的方式为继承的属性（包括存储属性和计算属性）添加属性观察器。你不必为非重写的计算属性添加属性观察器，因为可以通过它的 setter 直接监控和响应值的变化
 willSet 在新的值被设置之前调用   默认名称newValue
 didSet 在新的值被设置之后立即调用  默认名称oldValue
*/


class StepCounter {
    var totalSteps: Int = 0 {
        willSet (newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200

stepCounter.totalSteps = 360
stepCounter.totalSteps = 896




