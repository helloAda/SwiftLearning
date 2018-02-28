



//类和结构体对比

/*
 共同点:
 定义属性用于存储值
 定义方法用于提供功能
 定义下标操作使得可以通过下标语法来访问实例所包含的值
 定义构造器用于生成初始化值
 通过扩展以增加默认实现的功能
 实现协议以提供某种标准功能
 
 类还有其他附加功能:
 继承允许一个类继承另一个类的特性
 类型转换允许在运行时检查和解释一个类实例的类型
 析构器允许一个类实例释放任何其所被分配的资源
 引用计数允许对一个类的多次引用
 
 // 结构体总是通过被复制的方式在代码中传递，不使用引用计数
 */

//定义类和结构体
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//类和结构体的实例
let someResolution = Resolution()
let someVideoMode = VideoMode()

//属性访问
print("The width of someResolution is \(someResolution.width)")

print("The width of someVideoMode is \(someVideoMode.resolution.width)")


someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")


//结构体类型的成员逐一构造器
let vga = Resolution(width: 640, height: 480)


//结构体和枚举是值类型
/*
 值类型被赋予一个变量、常量或者被传递给一个函数的时候，其值会被拷贝。
 在Swift中所有的基本类型都是值类型，底层都是以结构体的形式所实现。
 */

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd //cinema和hd是两个完全不同的实例

cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")
print("hd is still 1920 pixls wide")

//枚举也遵循相同的行为准则
enum CompassPoint {
    case north, south, east, west
}
var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection = .east
if rememberedDirection == .west {
    print("The remembered direction is still .west")
}


//类是引用类型

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

/*
 需要注意的是tenEighty和alsoTenEighty被声明为常量而不是变量。然而你依然可以改变tenEighty.frameRate和alsoTenEighty.frameRate，因为tenEighty和alsoTenEighty这两个常量的值并未改变。它们并不“存储”这个VideoMode实例，而仅仅是对VideoMode实例的引用。所以，改变的是被引用的VideoMode的frameRate属性，而不是引用VideoMode的常量的值
  */

//恒等运算符判断是否引用同一个实例

if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}

/*
 === "等价于"表示两个类类型的常量或者变量引用同一个类实例。
 ==  "等于"表示两个实例的值"相等"或"相同"，判定时要遵照设计者定义的评判标准，因此相对于"相等"来说，这是一种更加合适的叫法
  */


//类和结构体的选择

/*
 按照通用的准则，当符合一条或者多条以下条件的时候，请考虑结构体
 
 1.该数据结构的主要目的是用来封装少量相关简单数据值
 2.有理由预计该数据结构的实例在被赋值或传递时，封装的数据将会被拷贝而不是引用。
 3.该数据结构中存储的值类型数据，也应该被拷贝，而不是被引用。
 4.该数据结构不需要去继承另一个既有类型的属性或者行为。
 */


//字符串、数组和字典类型的赋值与复制行为


/*
 Swift中，许多基本类型，诸如String，Array和Dictionary类型均以结构体的形式实现。这意味着被赋值给新的常量或变量，或者被传入函数或方法中时，它们的值会被拷贝
 Objective-C中NSString，NSArray和NSDictionary类型均以类的形式实现，而并非结构体。它们在被赋值或者被传入函数或方法时，不会发生值拷贝，而是传递现有实例的引用
 */
